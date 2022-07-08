<template>

    <div class="ltn__utilize-overlay"></div>

    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-overlay-theme-black-90 bg-image"
        data-bg="img/bg/9.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                        <div class="section-title-area ltn__section-title-2">
                            <h1 class="section-title white-color">Giỏ Hàng</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Giỏ Hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- SHOPING CART AREA START -->
    <div class="liton__shoping-cart-area mb-120">
        <div class="container" v-if="login">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping-cart-inner">
                        <div class="shoping-cart-table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="cart-product-remove">Xóa</th>
                                        <th class="cart-product-image text-center">Ảnh</th>
                                        <th class="cart-product-info text-center">Tên Sản Phẩm</th>
                                        <th class="cart-product-price text-center">Giá Tiền</th>
                                        <th class="cart-product-quantity text-center">Số Lượng</th>
                                        <th class="cart-product-subtotal text-center">Tổng Tiền</th>
                                    </tr>
                                </thead>
                                <tbody v-if="login.name == names && cart">
                                    <tr v-for="item in cart" :key="item">
                                        <td class="cart-product-remove"><a @click.prevent="removeFromCart(item)">x</a>
                                        </td>
                                        <td class="cart-product-image">
                                            <a href="product-details.html"><img
                                                    :src="'http://localhost:8080/uploads/' + item.images" alt="#"
                                                    style="width:100px; height:100px"></a>
                                        </td>
                                        <td class="cart-product-info">
                                            <h4><a href="#">{{ item.name }}</a></h4>
                                        </td>
                                        <td class="cart-product-price" v-if="item.salePrice == 0">{{ item.price }}</td>
                                        <td class="cart-product-price" v-if="item.salePrice > 0">{{ item.salePrice }}
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <input type="button" value="-" name="qtybutton"
                                                    class="cart-plus-minus-box" v-on:click="onCountMinus(item.id)"
                                                    style="border:none">
                                                <input type="text" v-bind:value="`${item.quantity}`" name="qtybutton"
                                                    class="cart-plus-minus-box">
                                                <input type="button" value="+" name="qtybutton"
                                                    class="cart-plus-minus-box" v-on:click="onCount(item.id)"
                                                    style="border:none">
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal" v-if="item.salePrice == 0">
                                            {{ formatPrice(item.quantity * item.price) }}</td>
                                        <td class="cart-product-subtotal" v-if="item.salePrice > 0">
                                            {{ formatPrice(item.quantity * item.salePrice) }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="shoping-cart-total mt-50">
                            <h4>Tổng số giỏ hàng</h4>
                            <table class="table">
                                <tbody v-if="cart">
                                    <tr>
                                        <td>Tổng phụ giỏ hàng</td>
                                        <td>{{ formatPrice(sum) }}đ</td>
                                    </tr>
                                    <tr>
                                        <td>Phí Ship</td>
                                        <td>0đ</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Thành Tiền</strong></td>
                                        <td><strong>{{ formatPrice(sum) }}đ</strong></td>
                                    </tr>
                                </tbody>
                                <tbody v-else>
                                    <tr>
                                        <td>Tổng phụ giỏ hàng</td>
                                        <td>0đ</td>
                                    </tr>
                                    <tr>
                                        <td>Phí Ship</td>
                                        <td>0đ</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Thành Tiền</strong></td>
                                        <td><strong>0đ</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="btn-wrapper text-right">
                                <a href="#" class="theme-btn-1 btn btn-effect-1">Tiến hành kiểm tra</a>
                            </div>
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
                </strong> Hãy đăng nhập để tiếp tục mua hàng.
            </div>
        </div>
    </div>
    <!-- SHOPING CART AREA END -->
</template>
<script>
import { ref } from '@vue/reactivity';
import { store } from "../store";
export default {
    setup() {
        const cart = store.state.cart;
        console.log(cart);
        function onCount(proId) {
            store.commit('onCount', proId);
        }
        function onCountMinus(proId) {
            store.commit('onCountMinus', proId);
        }
        const sum = store.getters.total;
        console.log(sum);
        function removeFromCart(item) {
            store.commit('removeFromCart', item);
        };
        let names = ref("")
        if (cart != null && cart.length > 0) {
            for (let i = 0; i < cart.length; i++) {
                names.value = cart[i].name_user

            }
        }
        let login = JSON.parse(localStorage.getItem("login"));
        return { cart, sum, onCount, onCountMinus, removeFromCart, login,names }
    },
    methods: {
        formatPrice(value) {
            let val = (value).toFixed(2).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
        }
    }
}
</script>