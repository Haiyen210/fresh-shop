<template>

    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-overlay-theme-black-90 bg-image"
        data-bg="img/bg/9.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                        <div class="section-title-area ltn__section-title-2">
                            <h1 class="section-title white-color">Yêu Thích Sản Phẩm</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Yêu Thích Sản Phẩm</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- WISHLIST AREA START -->
    <div class="liton__wishlist-area mb-105">
        <div class="container" v-if="acc">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping-cart-inner">
                        <div class="shoping-cart-table table-responsive">
                            <table class="table">

                                <tbody>
                                    <tr v-for="item in data" :key="item">
                                        <td class="cart-product-remove"><a href="#"
                                                v-on:click.stop.prevent="delFav(item.id)">x</a></td>
                                        <td class="cart-product-image">
                                            <router-link :to="{ name: 'Detail', params: { id: item.productId.id } }"><img
                                                    :src="'http://localhost:8080/uploads/' + item.productId.images">
                                            </router-link>
                                        </td>
                                        <td class="cart-product-info">
                                            <h4>
                                                <router-link :to="{ name: 'Detail', params: { id: item.productId.id } }">
                                                    {{ item.productId.name }}</router-link>
                                            </h4>
                                        </td>
                                        <td class="cart-product-price">{{ formatPrice(item.productId.salePrice) > 0 ?
                                                formatPrice(item.productId.salePrice) : formatPrice(item.productId.price)
                                        }}
                                        </td>
                                        <td class="cart-product-add-cart">
                                            <a class="submit-button-1" v-on:click.stop.prevent="onCart(item)"
                                                style="color:white;" title="Add to Cart" data-toggle="modal"
                                                data-target="#add_to_cart_modal">Thêm vào giỏ hàng</a>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" v-else>
            <div class="icon_hand">
                <i class="fas fa-hand-point-down"></i>
            </div>
            <div class="alert alert-danger">
                <strong>
                    <router-link :to="{ name: 'Login' }">Đăng Nhập Ngay!</router-link>
                </strong> Hãy đăng nhập để thêm sản phẩm yêu thích.
            </div>
        </div>
    </div>
    <!-- WISHLIST AREA START -->
</template>

<script>
import { store } from "../store";
import { computed, ref } from 'vue';
import AccountService from "../services/AccountService";
import FavoriteService from "@/services/FavoriteService";
export default {
    data() {
        return {
            data: []
        }
    },
    created() {
        const acc = JSON.parse(localStorage.getItem("account"));
        FavoriteService.getAll().then((res) => {
            for (let index = 0; index < res.data.length; index++) {
                const element = res.data[index];
                if (element.accountId.id == acc.id) {
                    this.data.push(element);
                }
            }
        }).catch(() => { }).finally(() => { });
    },
    methods: {
        formatPrice(value) {
            return new Intl.NumberFormat('en-US').format(value);
        },
        delFav(item) {
            FavoriteService.delete(item).then((res) => {
                this.data.splice(
                    this.data.findIndex((e) => e.id == item),
                    1
                )
            }).catch(() => { }).finally(() => { });
        },


    },
    setup() {
        const acc = JSON.parse(localStorage.getItem("account"));
        function onCart(itemId) {
            // if(user == null){
            //     router.replace({ name: "Login" });
            //   FavoriteService.delete(itemId.id).then((res)=>{
            //               this.data.splice(
            //             this.data.findIndex((e) => e.id == itemId.id),
            //             1
            //           )
            //         }).catch(()=>{}).finally(()=>{});
            store.commit('onCart', itemId.productId.id);
        }
        return { onCart, acc }
    }
}
</script>