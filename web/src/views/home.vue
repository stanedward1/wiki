<template>
  <a-layout>
    <a-layout-sider width="200" style="background: #fff">
      <a-menu
          mode="inline"
          :style="{ height: '100%', borderRight: 0 }"
          @click="handleClick"
      >
        <a-menu-item key="welcome">
          <MailOutlined/>
          <span>欢迎</span>
        </a-menu-item>
        <a-sub-menu v-for="item in level1" :key="item.id">
          <template v-slot:title>
            <span><user-outlined/>{{ item.name }}</span>
          </template>
          <a-menu-item v-for="child in item.children" :key="child.id">
            <MailOutlined/>
            <span>{{ child.name }}</span>
          </a-menu-item>
        </a-sub-menu>
      </a-menu>
    </a-layout-sider>
    <a-layout-content :style="{ padding: '15px 24px', minHeight: '280px' }">
      <div class="welcome" v-show="isShowWelcome">
        <h1>欢迎使用biu知识库</h1>
      </div>
      <div v-show="!isShowWelcome">
        <a-list v-show="!isShowWelcome" item-layout="vertical" size="large" :grid="{ gutter: 20, column: 3 }"
                :data-source="ebooks">
          <template #renderItem="{ item }">
            <a-list-item key="item.name">
              <template #actions>
          <span v-for="{ type, text } in actions" :key="type">
            <component v-bind:is="type" style="margin-right: 8px"/>
            {{ text }}
          </span>
              </template>
              <a-list-item-meta :description="item.description">
                <template #title>
                  <a :href="item.href">{{ item.name }}</a>
                </template>
                <template #avatar>
                  <a-avatar :src="item.cover"/>
                </template>
              </a-list-item-meta>
            </a-list-item>
          </template>
        </a-list>
      </div>
    </a-layout-content>
  </a-layout>
</template>

<script lang="ts">
import {defineComponent, onMounted, ref} from 'vue';
import axios from 'axios';
import {message} from 'ant-design-vue';
import {Tool} from "@/util/tool";

export default defineComponent({
  name: 'Home',
  components: {},
  setup() {
    console.log("setup");
    const ebooks = ref();

    // const openKeys = ref();
    const level1 = ref();
    let categorys: any;
    /**
     * 查询所有分类
     **/
    const handleQueryCategory = () => {
      axios.get("/category/all").then((response) => {
        const data = response.data;
        if (data.success) {
          categorys = data.content;
          console.log("原始数组：", categorys);

          // 加载完分类后，将侧边栏全部展开
          // openKeys.value = [];
          // for (let i = 0; i < categorys.length; i++) {
          //   openKeys.value.push(categorys[i-1].id)
          // }

          level1.value = [];
          level1.value = Tool.array2Tree(categorys, 0);
          console.log("树形结构：", level1.value);
        } else {
          message.error(data.message);
        }
      });
    };

    const isShowWelcome = ref(true);

    const handleClick = (value: any) => {
      console.log("menu click", value)
      console.log(value.key == 'welcome')
      if (value.key == 'welcome') {
        isShowWelcome.value = true;
        console.log(isShowWelcome)
      } else {
        isShowWelcome.value = false;
        console.log(isShowWelcome)
      }
    };

    // eslint-disable-next-line @typescript-eslint/no-empty-function
    onMounted(() => {
      handleQueryCategory();
      console.log("onMounted")
      // eslint-disable-next-line no-undef
      axios.get("/ebook/list", {
        params: {
          page: 1,
          size: 1000
        }
      }).then(function (response) {
        // eslint-disable-next-line no-undef
        const data = response.data
        ebooks.value = data.content.list
      });
    });
    return {
      ebooks,
      // ebooks2: toRef(ebooks1, "books"),
      pagination: {
        onChange: (page: any) => {
          console.log(page);
        },
        pageSize: 3,
      },
      // actions: [
      //   {type: 'StarOutlined', text: "156"},
      //   {type: 'LikeOutlined', text: '156'},
      //   {type: 'MessageOutlined', text: '2'}
      // ],
      handleClick,
      level1,

      isShowWelcome,
      // openKeys
    }
  }
});

</script>

<style scoped>
.ant-avatar {
  width: 50px;
  height: 50px;
  line-heignt: 50px;
  border-radius: 8%;
  margin: 5px 0;
}
</style>