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
                            <h1 class="section-title white-color">Kiểm Tra Đơn Hàng</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Kiểm Tra Đơn Hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- WISHLIST AREA START -->
    <div class="ltn__checkout-area mb-105">
        <div class="container">
            <form method="post" v-on:submit.prevent="onOrder">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__checkout-inner">

                            <div class="ltn__checkout-single-content mt-50">
                                <h4 class="title-2">Chi tiết thanh toán</h4>
                                <div class="ltn__checkout-single-content-info">
                                    <!-- <form> -->
                                    <h6>Thông tin cá nhân</h6>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-item input-item-name ltn__custom-icon">
                                                <input type="text" name="ltn__name" placeholder="Họ và Tên"
                                                    v-model="order.name">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-item input-item-email ltn__custom-icon">
                                                <input type="email" name="ltn__email" placeholder="Email"
                                                    v-model="order.email">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-item input-item-phone ltn__custom-icon">
                                                <input type="text" name="ltn__phone" placeholder="Số Điện Thoại"
                                                    v-model="order.phone">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-item input-item-website ltn__custom-icon">
                                                <input type="text" name="ltn__company" placeholder="Địa Chỉ"
                                                    v-model="order.address">
                                            </div>
                                        </div>

                                    </div>
                                    <h6>Ghi chú đơn hàng </h6>
                                    <div class="input-item input-item-textarea ltn__custom-icon">
                                        <textarea name="ltn__message"
                                            placeholder="Ghi chú về đơn đặt hàng của bạn, ví dụ: những lưu ý đặc biệt khi giao hàng."
                                            v-model="order.note"></textarea>
                                    </div>

                                    <!-- </form> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ltn__checkout-payment-method mt-50">
                            <h4 class="title-2">Phương thức thanh toán</h4>
                            <div id="checkout_accordion_1">
                                <!-- card -->
                                <div class="card">
                                    <h5 class="ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-2"
                                        aria-expanded="true">
                                        Thanh toán khi nhận hàng
                                    </h5>
                                </div>
                                <!-- card -->
                            </div>
                            <div class="ltn__payment-note mt-30 mb-30">
                                <p>Your personal data will be used to process your order, support your experience
                                    throughout
                                    this website, and for other purposes described in our privacy policy.</p>
                            </div>
                            <button class="btn theme-btn-1 btn-effect-1 text-uppercase" type="submit">Đặt hàng</button>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping-cart-total mt-50">
                            <h4 class="title-2">Tổng số giỏ hàng</h4>
                            <table class="table">
                                <tbody v-for="item in cart" :key="item">
                                    <tr>
                                        <td>{{ item.name }} <strong>× {{ item.quantity }}</strong></td>
                                        <td v-if="item.salePrice == 0">{{ formatPrice(item.quantity * item.price) }}
                                        </td>
                                        <td v-else>{{ formatPrice(item.quantity * item.salePrice) }}</td>
                                    </tr>

                                </tbody>
                                <tbody>
                                    <tr>
                                        <td>Phí Ship</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Tổng Tiền</strong></td>
                                        <td><strong>{{ formatPrice(sum) }}</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- WISHLIST AREA START -->
</template>
<script>
import { ref } from '@vue/reactivity';
import { store } from "../store";
import OrderService from "../services/OrderService"
import orderDetailService from "../services/OrderDetailService"
import router from '@/router';
import EmailService from '@/services/EmailService';
export default {
    setup() {
        let cart = store.state.cart;
        let user = JSON.parse(localStorage.getItem("login"));
        const radom = Math.floor(Math.random() * 90000) + 10000;
        let register = JSON.parse(localStorage.getItem("checkRegister"));
        let object;
        for (let i = 0; i < register.length; i++) {
            const element = register[i];
            if (element.name == user.name) {
                object = element;
            }

        }
        var newToday = new Date().toJSON().slice(0, 10);
        console.log(newToday);
        console.log(object);
        const order = ref({
            code: radom,
            name: object.name,
            email: object.email,
            phone: object.phone,
            address: object.address,
            totalQuantity: store.state.cart.length,
            totalPrice: store.getters.total,
            status: 1,
            accountId: object,
            note: "",
            createdDate: newToday
        })

        function onOrder() {
            if (order.value) {
                OrderService.create(order.value)
                    .then((res) => {//ok
                        localStorage.setItem("order", JSON.stringify(order.value));
                        var dataOD = [];
                        for (let i = 0; i < cart.length; i++) {
                            const element = cart[i];
                            const orderDetail = ref({
                                productId: element,
                                orderId: res.data,
                                price: element.price,
                                quantity: element.quantity
                            })
                            dataOD.push(orderDetail.value);
                        }
                        orderDetailService.create(dataOD)
                            .then((res) => {
                            }).catch((error) => {
                                console.log(error);

                            }).finally(() => {
                            })

                        // var od = JSON.parse(localStorage.getItem("orderDetail"));

                    }).catch((error) => {
                        console.log(error);
                    })
                    .finally(() => {
                    });
                // router.push('/checkout_success')
                localStorage.removeItem("carts")
                window.location.href = '/checkout_success';

            } else {
                console.log("false")
            }
        }

        return { cart, user, order, onOrder }
    },
    computed: {
        sum() {
            return store.getters.total;
        }
    },
    methods: {
        formatPrice(value) {
            return new Intl.NumberFormat('en-US').format(value);
        }
    },
}
</script>