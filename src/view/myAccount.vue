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
                            <h1 class="section-title white-color">Tài Khoản Của Tôi</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Tài Khoản Của Tôi</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- WISHLIST AREA START -->
    <div class="liton__wishlist-area pb-70">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- PRODUCT TAB AREA START -->
                    <div class="ltn__product-tab-area">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="ltn__tab-menu-list mb-50">
                                        <div class="nav">
                                            <a class="active show" data-toggle="tab" href="#liton_tab_1_1">Trang Chủ <i
                                                    class="fas fa-home"></i></a>
                                            <a data-toggle="tab" href="#liton_tab_1_2">Đơn Hàng <i
                                                    class="fas fa-file-alt"></i></a>
                                            <a data-toggle="tab" href="#liton_tab_1_4">Địa Chỉ <i
                                                    class="fas fa-map-marker-alt"></i></a>
                                            <a data-toggle="tab" href="#liton_tab_1_5">Chi tiết tài khoản <i
                                                    class="fas fa-user"></i></a>
                                            <a v-on:click.prevent="onLogout()">Đăng Xuất <i
                                                    class="fas fa-sign-out-alt"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div class="tab-content">
                                        <div class="tab-pane fade active show" id="liton_tab_1_1">
                                            <div class="ltn__myaccount-tab-content-inner">
                                                <p>Xin Chào <strong>{{ user.name }}</strong> </p>
                                                <p>Từ trang tổng quan tài khoản của mình, bạn có thể xem <span> gần đây
                                                        của mình
                                                        đơn đặt hàng </span>, quản lý <span> giao hàng và thanh toán của
                                                        bạn
                                                        địa chỉ </span> và <span> chỉnh sửa mật khẩu và tài khoản của
                                                        bạn
                                                        chi tiết </span>.</p>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="liton_tab_1_2">
                                            <div class="ltn__myaccount-tab-content-inner">
                                                <div class="table-responsive" v-if="isShow == false">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>Đơn Đặt Hàng</th>
                                                                <th>Ngày Đặt Hàng</th>
                                                                <th>Trạng Thái</th>
                                                                <th>Tổng Tiền</th>
                                                                <th>Hoạt Động</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr v-for="(item, index) in order" :key="index">
                                                                <td>{{ index + 1 }}</td>
                                                                <td>{{ item.createdDate }}</td>
                                                                <td v-if="item.status == 1">Chưa xác nhận</td>
                                                                <td v-else-if="item.status == 2">Đã xác nhận</td>
                                                                <td v-else-if="item.status == 3">Đang giao</td>
                                                                <td v-else-if="item.status == 4">Giao hàng thành công
                                                                </td>
                                                                <td v-else-if="item.status == 5">Đã Hủy</td>
                                                                <td>{{ formatPrice(item.totalPrice) }}</td>
                                                                <td class="d-flex">
                                                                    <a href="#"
                                                                        v-on:click.prevent="onView(item)">View</a>
                                                                    <form method="post"
                                                                        v-on:submit.prevent="onSubmitEditForm(item)"
                                                                        v-if="orders">
                                                                        <button v-if="item.status == 1"
                                                                            class="badge badge-danger"
                                                                            style="margin-left: 16px;">Hủy đơn
                                                                            hàng</button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <a href="#" v-if="isShow == true" v-on:click.prevent="back_to"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="16"
                                                        style="width: 32px; height: 32px" height="16"
                                                        fill="currentColor" class="bi bi-arrow-left-circle-fill"
                                                        viewBox="0 0 16 16">
                                                        <path
                                                            d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
                                                    </svg></a>
                                                <div class="col-xl-12 col-md-12 col-sm-12 col-12" v-if="isShow == true">
                                                    <table class="table table-bordered">

                                                        <tbody v-if="data">
                                                            <tr>
                                                                <th>Mã</th>
                                                                <td>{{ data.code }}</td>
                                                            </tr>
                                                            <tr>
                                                                <th> Tên Khách Hàng</th>
                                                                <td>{{ data.name }}</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Ngày Đặt Hàng</th>
                                                                <td>{{ data.createdDate }}</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Trạng Thái</th>
                                                                <td v-if="data.status == 1">Chưa xác nhận</td>
                                                                <td v-else-if="data.status == 2">Đã xác nhận</td>
                                                                <td v-else-if="data.status == 3">Đang giao</td>
                                                                <td v-else-if="data.status == 4">Giao hàng thành công
                                                                </td>
                                                                <td v-else-if="data.status == 5">Đã Hủy</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Tổng Tiền</th>
                                                                <td>{{ formatPrice(data.totalPrice) }}</td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="liton_tab_1_4">
                                            <div class="ltn__myaccount-tab-content-inner">
                                                <p>Các địa chỉ sau sẽ được sử dụng trên trang thanh toán theo mặc định.
                                                </p>
                                                <div class="row" v-if="orders">
                                                    <div class="col-md-6 col-12 learts-mb-30">
                                                        <h4>Địa chỉ thanh toán</h4>
                                                        <address>
                                                            <p><strong>{{ orders.name }}</strong></p>
                                                            <p>{{ orders.address }}</p>
                                                            <p>Số điện thoại: {{ orders.phone }}</p>
                                                        </address>
                                                    </div>
                                                    <div class="col-md-6 col-12 learts-mb-30">
                                                        <h4>Địa chỉ giao hàng</h4>
                                                        <address>
                                                            <p><strong>{{ orders.name }}</strong></p>
                                                            <p>{{ orders.address }}</p>
                                                            <p>Số điện thoại: {{ orders.phone }}</p>
                                                        </address>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="liton_tab_1_5">
                                            <div class="ltn__myaccount-tab-content-inner">
                                                <p>Các địa chỉ sau sẽ được sử dụng trên trang thanh toán theo mặc định.
                                                </p>
                                                <div class="ltn__form-box">
                                                    <form method="post" v-on:submit.prevent="onAccount">
                                                        <input type="hidden" v-model="element.id">
                                                        <div class="row mb-50">

                                                            <div class="col-md-6">
                                                                <label>Họ và Tên:</label>
                                                                <input type="text" name="name" v-model="element.name">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label>Email:</label>
                                                                <input type="email" name="email" placeholder="Email*"
                                                                    v-model="element.email">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label>Địa Chỉ:</label>
                                                                <input type="text" name="address" placeholder="Địa Chỉ*"
                                                                    v-model="element.address">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label>Số Điện Thoại:</label>
                                                                <input type="text" name="phone"
                                                                    placeholder="Số Điện Thoại*"
                                                                    v-model="element.phone">
                                                            </div>
                                                        </div>
                                                        <fieldset>
                                                            <legend>Thay đổi mật khẩu</legend>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label>Mật khẩu hiện tại:</label>
                                                                    <input type="password" name="oldPassword"
                                                                        v-model="oldPassword"
                                                                        :class="{ error: oldPasswordError.status, success: oldPasswordSuccess.status }">
                                                                    <p class="text-error"
                                                                        v-if="oldPasswordError.status">{{
                                                                                oldPasswordError.text
                                                                        }}</p>
                                                                    <p class="success-text"
                                                                        v-if="oldPasswordSuccess.status">{{
                                                                                oldPasswordSuccess.text
                                                                        }}</p>
                                                                    <label>Mật khẩu mới:</label>
                                                                    <input type="password" name="newPassword"
                                                                        v-model="newPassWord"
                                                                        :class="{ error: newPasswordError.status, success: newPasswordSuccess.status }">
                                                                    <p class="text-error"
                                                                        v-if="newPasswordError.status">{{
                                                                                newPasswordError.text
                                                                        }}</p>
                                                                    <p class="success-text"
                                                                        v-if="newPasswordSuccess.status">{{
                                                                                newPasswordSuccess.text
                                                                        }}</p>
                                                                    <label>Xác nhận mật khẩu mới:</label>
                                                                    <input type="password" name="confirmPassword"
                                                                        v-model="confirmPassword"
                                                                        :class="{ error: confirmPasswordError.status, success: confirmPasswordSuccess.status }">
                                                                    <p class="text-error"
                                                                        v-if="confirmPasswordError.status">{{
                                                                                confirmPasswordSuccess.text
                                                                        }}</p>
                                                                    <p class="success-text"
                                                                        v-if="confirmPasswordSuccess.status">{{
                                                                                newPasswordSuconfirmPasswordSuccessccess.text
                                                                        }}</p>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <div class="btn-wrapper">
                                                            <button type="submit"
                                                                class="btn theme-btn-1 btn-effect-1 text-uppercase">Lưu
                                                                Thay Đổi</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- PRODUCT TAB AREA END -->
                </div>
            </div>
        </div>
    </div>

    <!-- WISHLIST AREA START -->
</template>
<script>
import OrderService from '@/services/OrderService';
import { ref } from 'vue';
import myAccount from '../myAccount'

export default {
    setup() {
        const { user,
            orders,
            element,
            onAccount,
            newPassWord,
            oldPassword,
            confirmPassword,
            newPasswordError,
            newPasswordSuccess,
            oldPasswordError,
            oldPasswordSuccess,
            confirmPasswordError,
            confirmPasswordSuccess, onLogout } = myAccount();
        const data = ref("");
        const isShow = ref(false)
        function onView(item) {
            data.value = item;
            isShow.value = true
        }
        function back_to() {
            isShow.value = false
        }
        return {
            user,
            orders,
            element,
            onAccount,
            newPassWord,
            oldPassword,
            confirmPassword,
            newPasswordError,
            newPasswordSuccess,
            oldPasswordError,
            oldPasswordSuccess,
            confirmPasswordError,
            confirmPasswordSuccess,
            onLogout,
            onView, data, isShow, back_to
        }
    },
    data() {
        return { order: null }
    },
    created() {
        OrderService.getAll()
            .then((res) => {
                this.order = res.data;
            })
            .catch((error) => {
                console.log(error);
            })
            .finally(() => {
                //Perform action in always
            });

    },
    methods: {
        formatPrice(value) {
            return new Intl.NumberFormat('en-US').format(value);
        },
        onSubmitEditForm(item) {
            console.log(item);
            item.status = 5;
            OrderService.update(item)
                .then((res) => {
                    console.log(res);

                })
                .catch((error) => {
                    console.log(error);
                })
                .finally(() => {
                });
        },
    },
}
</script>