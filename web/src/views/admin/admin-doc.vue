<template>
  <a-layout>
    <a-layout-content :style="{ padding: '15px 24px', minHeight: '280px' }">
      <p>
        <a-form layout="inline" :model="param">
          <a-form-item>
            <a-button type="primary" @click="handleQuery()">
              查询
            </a-button>
          </a-form-item>
          <a-form-item>
            <a-button type="primary" @click="add()">
              新增
            </a-button>
          </a-form-item>
        </a-form>
      </p>
      <a-table
          :columns="columns"
          :row-key="record => record.id"
          :data-source="level1"
          :loading="loading" ,
          :pagination="false">
        <template #cover="{ text: cover }">
          <img v-if="cover" :src="cover" alt="avatar"/>
        </template>
        <template v-slot:action="{text,record}">
          <a-space size="small">
            <a-button type="primary" @click="edit(record)">编辑</a-button>
            <a-popconfirm
                title="删除后不可恢复，确认删除？"
                ok-text="是"
                cancel-text="否"
                @confirm="handleDelete(record.id)">
              <a-button type="danger">删除</a-button>
            </a-popconfirm>
          </a-space>
        </template>
      </a-table>
    </a-layout-content>
  </a-layout>

  <a-modal
      title="文档表单"
      v-model:visible="modalVisible"
      :confirm-loading="modalLoading"
      @ok="handleModalOk"
  >
    <a-form :model="doc" :label-col="{span: 6}">
      <a-form-item label="名称">
        <a-input v-model:value="doc.name"/>
      </a-form-item>
      <a-form-item label="父文档">
        <a-input v-model:value="doc.parent"/>
        <a-select
            ref="select"
            v-model:value="doc.parent"
        >
          <a-select-option v-for="c in level1" :key="c.id" :disabled="doc.id===c.id">{{ c.name }}</a-select-option>
        </a-select>
      </a-form-item>
      <a-form-item label="顺序">
        <a-input v-model:value="doc.sort"/>
      </a-form-item>
    </a-form>
  </a-modal>
</template>

<script lang="ts">
import {defineComponent, onMounted, ref} from "vue";
import axios from "axios";
import {message} from "ant-design-vue";
import {Tool} from "@/util/tool";

export default defineComponent({
  name: 'AdminDoc',
  setup() {
    const param = ref();
    param.value = {};
    const docs = ref();
    const loading = ref(false);
    const columns = [
      {
        title: '名称',
        dataIndex: 'name'
      },
      {
        title: '父文档',
        dataIndex: 'parent'
      },
      {
        title: '排序',
        dataIndex: 'sort'
      },
      {
        title: 'Action',
        key: 'action',
        slots: {customRender: 'action'}
      }
    ];

    const level1 = ref();

    /**
     * 数据查询
     **/
    const handleQuery = () => {
      loading.value = true;
      axios.get("/doc/all").then((response) => {
            loading.value = false;
            const data = response.data;
            if (data.success) {
              docs.value = data.content;
              console.log("原始数组：", docs.value);
              level1.value = [];
              level1.value = Tool.array2Tree(docs.value, 0);
              console.log("树形结构", level1);
            } else {
              message.error(data.message);
            }
          }
      )
      ;
    };

    // 表单
    const doc = ref({});
    const modalVisible = ref(false);
    const modalLoading = ref(false);
    const handleModalOk = () => {
      modalLoading.value = true;

      axios.post("/doc/save", doc.value).then((response) => {
            modalLoading.value = false;
            const data = response.data;
            if (data.success) {
              modalLoading.value = false;
              modalVisible.value = false;
              handleQuery();
            } else {
              message.error(data.message);
            }
          }
      )
      ;

    };

    // 编辑
    const edit = (record: any) => {
      modalVisible.value = true;
      doc.value = Tool.copy(record)
    };

    // 新增
    const add = () => {
      modalVisible.value = true;
      doc.value = {}
    };

    const handleDelete = (id: number) => {
      axios.delete("/doc/delete/" + id).then((response) => {
        const data = response.data;
        if (data.success) {
          handleQuery();
        }
      });
    };

    onMounted(() => {
      handleQuery();
    });

    return {
      param,
      // docs,
      columns,
      loading,

      edit,
      add,
      handleDelete,
      handleQuery,
      level1,

      doc,
      modalVisible,
      modalLoading,
      handleModalOk
    }
  }
})
;
</script>
