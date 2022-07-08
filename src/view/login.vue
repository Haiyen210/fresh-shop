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
                            <h1 class="section-title white-color">Đăng Nhập</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Đăng Nhập</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- LOGIN AREA START -->
    <div class="ltn__login-area pb-65">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title-area text-center">
                        <h1 class="section-title">Đăng Nhập <br>Tài khoản của bạn</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="account-login-inner">
                         <p class="text-error" v-if="errorLogin.status">{{ errorLogin.text }}</p>
                        <form action="#" class="ltn__form-box contact-form-box" v-on:submit.prevent="onLogin">
                            <input type="text" name="email" placeholder="Email*" id="email" v-model="login.email"
                                :class="{ error: errorEmail.status, success: successEmail.status }">
                            <p class="text-error" v-if="errorEmail.status">{{ errorEmail.text }}</p>
                            <p class="success-text" v-if="successEmail.status">{{ successEmail.text }}</p>
                            <input type="password" name="password" placeholder="Mật Khẩu*" id="password"
                                :class="{ error: errorPassword.status, success: successPassword.status }"
                                v-model="login.password">
                            <p class="text-error" v-if="errorPassword.status">{{ errorPassword.text }}</p>
                            <p class="success-text" v-if="successPassword.status">{{ successPassword.text }}</p>
                            <div class="btn-wrapper mt-0">
                                <button class="theme-btn-1 btn btn-block" type="submit">ĐĂNG NHẬP</button>
                            </div>
                            <div class="go-to-btn mt-20">
                                <a href="#"><small>QUÊN MẬT KHẨU?</small></a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="account-create text-center pt-50">
                        <h4>KHÔNG CÓ TÀI KHOẢN?</h4>
                        <p>Thêm các mặt hàng vào danh sách yêu thích của bạn, các khuyến nghị được cá nhân hóa kiểm tra
                            nhanh hơn theo dõi đăng ký đơn đặt hàng của bạn</p>
                        <div class="btn-wrapper">
                            <router-link :to="{ name: 'Register' }" class="theme-btn-1 btn black-btn">TẠO TÀI KHOẢN
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGIN AREA END -->
</template>
<script>
import useLogin from "../login"
export default {
    setup() {
        const { onLogin, login, errorEmail, successEmail, errorPassword, successPassword,errorLogin } = useLogin();
        return { onLogin, login, errorEmail, successEmail, errorPassword, successPassword,errorLogin }
    }
}
</script>