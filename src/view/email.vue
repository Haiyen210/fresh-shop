<template>
    <div class="ltn__utilize-overlay">
    </div>
    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-overlay-theme-black-90 bg-image"
        data-bg="img/bg/9.jpg" style="display: inline-block;">
    </div>
    <!-- BREADCRUMB AREA END -->
    <!-- Nhập Email -->
    <div class="modal-dialog" role="document" v-if="isShow == false && isShowPass == false">
        <div class="modal-content">
            <form method="post">
                <div class="modal-body">
                    <p class="modal-title" id="exampleModalLabel">Nhập email để lấy lại mật khẩu:</p>
                    <input type="email" v-model="email_confirm"
                        :class="{ error: error_email.status == true, success: error_email.status == false }">
                    <p class="text-error" v-if="error_email.status == true" style="margin-top: -1.75rem;">{{
                            error_email.text
                    }}</p>
                    <p class="text-error" v-if="error_email.status == false" style="margin-top: -1.75rem;">{{
                            error_email.text
                    }}</p>
                </div>
                <div class="modal-footer">
                    Tiếp Tục
                    <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">X</button> -->
                    <a style="font-size: 30px;" v-on:click.prevent="onEmail"><i
                            class="far fa-arrow-alt-circle-right"></i></a>
                </div>
            </form>
        </div>
    </div>
    <!-- Mã Xác Nhận -->
    <Transition>
        <div class="modal-dialog" role="document" v-if="isShow == true && isShowPass == false">
            <div class="modal-content">
                <form method="post">
                    <div class="modal-body">
                        <p class="modal-title" id="exampleModalLabel">Nhập Mã Xác Nhận:</p>
                        <input type="text" v-model="code"
                            :class="{ error: error_code.status == true, success: error_code.status == false }">
                        <p class="text-error" v-if="error_code.status == true" style="margin-top: -1.75rem;">{{
                                error_code.text
                        }}</p>
                        <p class="text-error" v-if="error_code.status == false" style="margin-top: -1.75rem;">{{
                                error_code.text
                        }}</p>
                    </div>
                    <div class="modal-footer">
                        <div style="margin-right: 16.25rem;">
                            <a href="" v-on:click.prevent="onClose">
                                <i class="far fa-arrow-alt-circle-left" style="font-size: 30px;"></i> Quay lại </a>
                        </div>
                        <div>
                            <a v-on:click.prevent="onCode">Tiếp Tục<i style="font-size: 30px;"
                                    class="far fa-arrow-alt-circle-right"></i></a>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </Transition>
    <!-- Nhập mật khẩu -->
    <Transition>
        <div class="modal-dialog" role="document" v-if="isShowPass == true">
            <div class="modal-content">
                <form method="post">
                    <div class="modal-body">
                        <p class="modal-title" id="exampleModalLabel">Nhập Mật khẩu mới:</p>
                        <input type="password" v-model="password"
                            :class="{ error: error_password.status == true, success: error_password.status == false }">
                        <p class="text-error" v-if="error_password.status == true" style="margin-top: -1.75rem;">{{
                                error_password.text
                        }}</p>
                        <p class="text-error" v-if="error_password.status == false" style="margin-top: -1.75rem;">{{
                                error_password.text
                        }}</p>
                        <p class="modal-title" id="exampleModalLabel">Xác nhận mật khẩu mới:</p>
                        <input type="password" v-model="confirm_password"
                            :class="{ error: errorPasswordConfirm.status == true, success: errorPasswordConfirm.status == false }">
                        <p class="text-error" v-if="errorPasswordConfirm.status == true" style="margin-top: -1.75rem;">
                            {{
                                    errorPasswordConfirm.text
                            }}</p>
                        <p class="text-error" v-if="errorPasswordConfirm.status == false" style="margin-top: -1.75rem;">
                            {{
                                    errorPasswordConfirm.text
                            }}</p>
                    </div>
                    <div class="modal-footer">
                        <div style="margin-right: 16.25rem;">
                            <a href="" v-on:click.prevent="onCloses">
                                <i class="far fa-arrow-alt-circle-left" style="font-size: 30px;"></i> Quay lại </a>
                        </div>
                        <div>
                            <a v-on:click.prevent="onPassword">Tiếp Tục<i style="font-size: 30px;"
                                    class="far fa-arrow-alt-circle-right"></i></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </Transition>
</template>
<style>
.modal-dialog {
    margin-top: -249px;
    margin-bottom: 100px;
}

.v-enter-active,
.v-leave-active {
    transition: opacity 0.5s ease;
}

.v-enter-from,
.v-leave-to {
    opacity: 0;
}
</style>
<script>
import { createToast } from 'mosha-vue-toastify';
import 'mosha-vue-toastify/dist/style.css'
import AccountService from '@/services/AccountService';
import EmailService from '@/services/EmailService';
import router from '../router'
export default {
    data() {
        return {
            email_confirm: "",
            random: Math.floor(100000 + Math.random() * 900000),
            isShow: false,
            isShowPass: false,
            error_email: {
                text: "",
                status: false
            },
            code: "",
            error_code: {
                text: "",
                status: false
            },
            updateAccount: null,
            password: "",
            confirm_password: "",
            error_password: {
                text: "",
                status: false
            },
            errorPasswordConfirm: {
                text: "",
                status: false
            }

        }
    },
    methods: {
        onEmail() {
            if (this.email_confirm.length == 0) {
                this.error_email = {
                    text: "Email không được để trống",
                    status: true
                }
            } else {
                this.error_email = {
                    text: "",
                    status: false
                }
            }
            if (this.email_confirm) {
                AccountService.getEmail(this.email_confirm).
                    then((res) => {
                        this.updateAccount = res.data;
                        if (res.data.length != 0) {
                            res.data.token = this.random;
                            AccountService.update(res.data).then((res) => {
                                console.log(res.data.token);
                                this.isShow = true
                                EmailService.sendEmail(res.data).then((res) => {
                                    console.log(res);
                                }).catch((error) => {
                                    console.log(error);
                                }).finally(() => { })
                            }).catch((error) => {
                                console.log(error);
                            }).finally(() => { })
                        } else {
                            alert("Không tìm thấy Email này")
                        }

                    }).catch((error) => {
                        console.log(error);
                    }).finally(() => { })
            }

        },
        onCode() {
            if (this.code.length == 0) {
                this.error_code = {
                    text: "Mã xác nhận không được để trống",
                    status: true
                }
            } else if (this.code != this.random) {
                this.error_code = {
                    text: "Mã xác nhận không đúng",
                    status: true
                }
            } else {
                this.error_code = {
                    text: "",
                    status: false
                }
            }
            if (this.code && this.code == this.random) {
                this.isShowPass = true;

            }
        },
        onClose() {
            this.isShow = false;
        },
        onCloses() {
            this.isShowPass = false;
        },
        onPassword() {
            if (this.password.length == 0) {
                this.error_password = {
                    text: "Mật Khẩu không được để trống",
                    status: true
                }
            } else if (this.password.length < 6) {
                this.error_password = {
                    text: "Mật Khẩu phải từ 6 kí tự đổ lên",
                    status: true
                }
            } else {
                this.error_password = {
                    text: "",
                    status: false
                }
            }

            if (this.confirm_password.length == 0) {
                this.errorPasswordConfirm = {
                    text: "Mật khẩu không được để trống",
                    status: true
                }
            }
            else if (this.confirm_password != this.password) {
                this.errorPasswordConfirm = {
                    text: "Mật khẩu không khớp.Vui lòng nhập lại",
                    status: true
                }
            } else {
                this.errorPasswordConfirm = {
                    text: "",
                    status: false
                }
            }

            if (this.password.length >= 6 && this.confirm_password == this.password) {
                this.updateAccount.password = this.confirm_password;
                AccountService.update(this.updateAccount).then((res) => {
                    console.log(res.data.password);
                    console.log(res.data);
                    createToast({
                        title: 'Thành công',
                        description: 'Đổi mật khẩu thành công',
                        type: 'success',
                        timeout: 5000,

                    })
                    AccountService.getAll()
                        .then((res) => {
                            localStorage.setItem("checkRegister", JSON.stringify(res.data));
                        })
                        .catch((error) => {
                            console.log(error);
                        })
                        .finally(() => {
                            // console.log(this.user);
                        })
                        router.push('/login');
                }).catch((error) => {
                    console.log(error);
                }).finally(() => { })
            }
        }
    }
}
</script>