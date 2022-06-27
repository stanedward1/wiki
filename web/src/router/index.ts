import {createRouter, createWebHistory, RouteRecordRaw} from 'vue-router'
import Home from '../views/home.vue'
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import About from '../views/about'
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import AdminEbook from '../views/admin/admin-ebook'
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import AdminCategory from '../views/admin/admin-category'

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/about',
        name: 'About',
        component: About,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        // component: () => import(/* webpackChunkName: "about" */ '../views/admin-ebook.vue')
    },
    {
        path: '/admin/ebook',
        name: 'AdminEbook',
        component: AdminEbook,
    },
    {
        path: '/admin/category',
        name: 'AdminCategory',
        component: AdminCategory,
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router
