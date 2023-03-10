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
            import ( /*webpackChunkName: "myAccount" */ "./view/myAccount"),
    },
    {
        path: "/checkout",
        name: "CheckOut",
        component: () =>
            import ( /*webpackChunkName: "checkout" */ "./view/checkout"),
    },
    {
        path: "/favorite",
        name: "Favorite",
        component: () =>
            import ( /*webpackChunkName: "Favorite" */ "./view/favorite"),
    },
    {
        path: "/checkout_success",
        name: "CheckOut_Success",
        component: () =>
            import ( /*webpackChunkName: "checkout_success" */ "./view/checkout_success"),
    },
    {
        path: "/email-confirm",
        name: "Email",
        component: () =>
            import ( /*webpackChunkName: "email" */ "./view/email"),
    },
    {
        path: "/:pathMatch(.*)*",
        name: "NotFound",
        component: () =>
            import ( /*webpackChunkName: "notFound" */ "./view/notFound"),
    },
];
const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});
// router.beforeEach(function(transition) {
//     if (transition.to.path === '/*') {
//         window.location.href = '/404'
//     } else {
//         transition.next()
//     }
// });
export default router;