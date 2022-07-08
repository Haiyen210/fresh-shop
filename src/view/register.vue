<template>
    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-overlay-theme-black-90 bg-image"
        data-bg="img/bg/9.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                        <div class="section-title-area ltn__section-title-2">
                            <h1 class="section-title white-color">Đăng Ký</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Đăng Ký</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- LOGIN AREA START (Register) -->
    <div class="ltn__login-area pb-110">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title-area text-center">
                        <h1 class="section-title">Đăng Ký <br>Tài Khoản Của Bạn</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="account-login-inner">
                        <form method="post" enctype='multipart/form-data' v-on:submit.prevent="onSubmitForm"
                            class="ltn__form-box contact-form-box">

                            <input type="text" placeholder="Họ và Tên*" id="name" v-model="register.name"
                                :class="{ error: nameError.status, success: nameSuccess.status }">
                            <p class="text-error" v-if="nameError.status">{{ nameError.text }}</p>
                            <p class="success-text" v-if="nameSuccess.status">{{ nameSuccess.text }}
                            </p>

                            <input type="date" id="birthday" placeholder="Ngày Sinh" v-model="register.birthday">

                            <input type="text" name="phone" placeholder="Số Điện Thoại*" v-model="register.phone"
                                :class="{ error: phoneError.status, success: phoneSuccess.status }">
                            <p class="text-error" v-if="phoneError.status">{{ phoneError.text }}</p>
                            <p class="success-text" v-if="phoneSuccess.status">{{ phoneSuccess.text }}</p>

                            <input type="text" name="address" placeholder="Địa Chỉ*" v-model="register.address"
                                :class="{ error: addressError.status, success: addressSuccess.status }">
                            <p class="text-error" v-if="addressError.status">{{ addressError.text }}</p>
                            <p class="success-text" v-if="addressSuccess.status">{{ addressSuccess.text }}</p>

                            <input type="email" name="email" placeholder="Email*" v-model="register.email"
                                :class="{ error: emailError.status, success: emailSuccess.status }">
                            <p class="text-error" v-if="emailError.status">{{ emailError.text }}</p>
                            <p class="success-text" v-if="emailSuccess.status">{{ emailSuccess.text }}</p>

                            <input type="password" name="password" placeholder="Mật Khẩu*" v-model="register.password"
                                :class="{ error: passwordError.status, success: passwordSuccess.status }">
                            <p class="text-error" v-if="passwordError.status">{{ passwordError.text }}</p>
                            <p class="success-text" v-if="passwordSuccess.status">{{ passwordSuccess.text }}</p>

                            <div class="row">
                                <label class="col-form-label col-xl-3 col-sm-3 col-sm-2 pt-0">Giới Tính</label>
                                <div class="col-xl-9 col-lg-9 col-sm-10">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" v-model="register.gender"
                                            :value="true" id="gender" style="width: 16px;height: 16px;" />
                                        <label class="form-check-label" for="flexCheckDefault"> Nữ
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" v-model="register.gender"
                                            :value="false" id="gender" style="width: 16px;height: 16px;" checked />
                                        <label class="form-check-label" for="flexCheckChecked"> Nam </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row mb-4 mt-5">
                                <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Ảnh</label>
                                <div class="col-md-6">
                                    <p class="btn btn-success btn-sm" @click="$refs.file.click()">
                                        Chọn file
                                    </p>
                                </div>
                                <div class="col-8">
                                    <label class="btn btn-default p-0">
                                        <input type="file" accept="image/*" ref="file" @change="selectImage"
                                            :hidden="true" />
                                    </label>
                                </div>
                                <div class="col-xl-10 col-lg-9 col-sm-10">
                                    <img v-if="url" :src="url" style="width: 600px; height: 500px; margin-left: 20%" />
                                </div>
                            </div>
                            <div class="btn-wrapper">
                                <button class="theme-btn-1 btn reverse-color btn-block" type="submit">Đăng Ký</button>
                            </div>
                        </form>
                        <div class="by-agree text-center">
                            <p>Bằng cách tạo một tài khoản, bạn đồng ý với:</p>
                            <p><a href="#">ĐIỀU KIỆN ĐIỀU KIỆN &nbsp; &nbsp;| &nbsp; &nbsp; CHÍNH SÁCH BẢO MẬT</a></p>
                            <div class="go-to-btn mt-50">
                                <router-link :to="{name:'Login'}"> ĐÃ CÓ TÀI KHOẢN?</router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGIN AREA END -->
</template>
<script>
import UploadService from "@/services/UploadService";
import AccountService from "@/services/AccountService";
import router from '@/router';
export default {
    data() {
        return {
            user: null,
            message: "",
            url: null,
            currentImage: undefined,
            register: {
                id: null,
                code: "",
                name: "",
                email: "",
                phone: "",
                password: "",
                address: "",
                birthday: "",
                gender: "",
                images: "",
                role: 1
            },
            random: null,
            nameError: {
                text: "",
                status: false,
            },
            nameSuccess: {
                text: "",
                status: false,
            },
            emailError: {
                text: "",
                status: false,
            },
            emailSuccess: {
                text: "",
                status: false,
            },
            phoneError: {
                text: "",
                status: false,
            },
            phoneSuccess: {
                text: "",
                status: false,
            },
            passwordError: {
                text: "",
                status: false,
            },
            passwordSuccess: {
                text: "",
                status: false,
            },
            addressError: {
                text: "",
                status: false,
            },
            addressSuccess: {
                text: "",
                status: false,
            },
            birthdayError: {
                text: "",
                status: false,
            },
            birthdaySuccess: {
                text: "",
                status: false,
            },
        }

    },
    mounted() {
        AccountService.getAll()
            .then((res) => {
                this.user = res.data;
                localStorage.setItem("checkRegister", JSON.stringify(res.data));
            })
            .catch((error) => {
                console.log(error);
            })
            .finally(() => {
                // console.log(this.user);
            })
    },
    methods: {
        onSubmitForm() {
            this.random = Math.floor(Math.random() * 90000) + 10000;
            if (this.register.name.length == 0) {
                this.nameError = {
                    text: "Tên không được để trống",
                    status: true
                }

            } else if (this.register.name.length < 6 || this.register.name.length > 50) {
                this.nameError = {
                    text: "Tên phải từ 6 đến 50 kí tự",
                    status: true
                }


            } else if (this.register.name.length > 6 || this.register.name.length < 50) {
                this.nameSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.nameError = {
                    text: "",
                    status: false
                }
            } else {
                this.nameError = {
                    text: "",
                    status: false
                }
            }

            const regex = /^\w+([.-]?\w+)*@[a-z]+([.-]?\w+)*(.\w{2,3})+$/;
            const check = JSON.parse(localStorage.getItem("checkRegister"));
            var check_email;
            var check_phone;
            for (let i = 0; i < check.length; i++) {
                if (this.register.email == check[i].email) {
                    check_email = check[i].email
                }
                if (this.register.phone == check[i].phone) {
                    check_phone = check[i].phone
                }

            }
            console.log(check_email);
            console.log(check_phone);
            if (this.register.email.length == 0) {
                this.emailError.text = "Email không được bỏ trống",
                    this.emailError.status = true
            } else if (!regex.test(this.register.email)) {
                this.emailError.text = "Email không đúng định dạng",
                    this.emailError.status = true
            }
            else if (this.register.email == check_email) {
                this.emailError.text = "Email  này đã tồn tại",
                    this.emailError.status = true
            }
            else if (regex.test(this.register.email)) {
                this.emailSuccess.text = "Thành công!!";
                this.emailSuccess.status = true;
                this.emailError.status = false
            }
            else {
                this.emailError.text = "",
                    this.emailError.status = false
            }

            if (this.register.phone.length == 0) {
                this.phoneError = {
                    text: "Số điện thoại không được để trống",
                    status: true
                }

            } else if (this.register.phone.length != 10) {
                this.phoneError = {
                    text: "Số điện thoại phải chứa 10 kí tự ",
                    status: true
                }
            } else if (this.register.phone == check_phone) {
                this.phoneError = {
                    text: "Số điện thoại này đã được sử dụng ",
                    status: true
                }
            }
            else if (this.register.phone.length < 11 && this.register.phone.length > 9) {
                this.phoneSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.phoneError = {
                    text: "",
                    status: false
                }
            } else {
                this.phoneError = {
                    text: "",
                    status: false
                }
            }

            if (this.register.password.length == 0) {
                this.passwordError = {
                    text: "Mật khẩu không được để trống",
                    status: true
                }

            } else if (this.register.password.length < 6) {
                this.passwordError = {
                    text: "Mật khẩu phải chứa ít nhất 6 kí tự ",
                    status: true
                }
            } else if (this.register.password.length >= 6) {
                this.passwordSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.passwordError = {
                    text: "",
                    status: false
                }
            } else {
                this.passwordError = {
                    text: "",
                    status: false
                }
            }

            if (this.register.address.length == 0) {
                this.addressError = {
                    text: "Địa chỉ không được để trống",
                    status: true
                }

            } else if (this.register.address.length < 6 || this.register.address.length > 50) {
                this.addressError = {
                    text: "Địa chỉ phải từ 6 đến 50 kí tự",
                    status: true
                }
            } else if (this.register.address.length > 6 || this.register.address.length < 50) {
                this.addressSuccess = {
                    text: "Thành công!",
                    status: true
                }
                this.addressError = {
                    text: "",
                    status: false
                }
            } else {
                this.addressError = {
                    text: "",
                    status: false
                }
            }
            if (this.nameSuccess.status == true && this.emailSuccess.status == true && this.phoneSuccess.status == true && this.passwordSuccess.status == true && this.addressSuccess.status == true) {
                UploadService.upload(this.currentImage)
                    .then((response) => {
                        console.log();
                        this.message = response.data.message;
                    })
                    .catch((err) => {
                        this.message = "Không thể tải ảnh lên ! " + err;
                        this.currentImage = undefined;
                    });
                this.register.code = this.random;
                AccountService.create(this.register)
                    .then((res) => {
                        //Perform Success Action
                        this.ID = res.data.id;
                        this.register.id = this.ID;
                        console.log(res);
                        check.push(this.register);
                        localStorage.setItem("checkRegister", JSON.stringify(check));
                    })
                    .catch((error) => {
                        // error.response.status Check status code
                        console.log(error);
                    })
                    .finally(() => {
                        //Perform action in always
                    });
                    router.push('/login');
            }

        },
        selectImage() {
            this.currentImage = this.$refs.file.files.item(0);
            this.url = URL.createObjectURL(this.currentImage);
            this.register.images = this.$refs.file.files.item(0).name;
        }
    }
}
</script>