import { createRouter, createWebHistory } from "vue-router";
import Home from "./view/home";
import Product from "./view/product";
const routes = [{
        path: "/",
        name: "Home",
        component: Home,
    },
    {
        path: "/product",
        name: "Product",
        component: Product,
    },
    {
        path: "/product/:id",
        name: "Detail",
        component: () =>
            import ( /*webpackChunkName: "productDetail" */ "./view/productDetail"),
    },
    {
        path: "/cart",
        name: "Cart",
        component: () =>
            import ( /*webpackChunkName: "Cart" */ "./view/cart"),
    },
    {
        path: "/blog",
        name: "Blog",
        component: () =>
            import ( /*webpackChunkName: "Blog" */ "./view/blog"),
    },
    {
        path: "/blog/:id",
        name: "BlogDetail",
        component: () =>
            import ( /*webpackChunkName: "BlogDetail" */ "./view/blogDetail"),
    },
    {
        path: "/register",
        name: "Register",
        component: () =>
            import ( /*webpackChunkName: "Register" */ "./view/register"),
    },
    {
        path: "/login",
        name: "Login",
        component: () =>
            import ( /*webpackChunkName: "Login" */ "./view/login"),
    },
    {
        path: "/myAccount",
        name: "MyAccount",
        component: () =>
            import ( /*webpackChunkName: "MyAccount" */ "./view/myAccount"),
    },
];
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});

export default router;