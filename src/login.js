import { ref } from "vue";
import router from "./router";
import { createToast } from 'mosha-vue-toastify';
import 'mosha-vue-toastify/dist/style.css'
export default function() {
    const login = ref({
        name: "",
        email: "",
        password: "",
        image: ""
    });
    const errorEmail = ref({
        text: "",
        status: false
    })
    const successEmail = ref({
        text: "",
        status: false,
    })
    const errorPassword = ref({
        text: "",
        status: false
    })
    const successPassword = ref({
        text: "",
        status: false,
    })
    const errorLogin = ref({
        text: "",
        status: false,
    })

    function onLogin() {
        const user = JSON.parse(localStorage.getItem("checkRegister"));
        let emails = "";
        let passwords = "";
        let names = "";
        let roles = "";
        let images = ""
        if (user) {
            for (let i = 0; i < user.length; i++) {
                if (login.value.email == user[i].email) {
                    emails = user[i].email;
                    passwords = user[i].password;
                    names = user[i].name;
                    roles = user[i].role;
                    images = user[i].images;
                    localStorage.setItem("account", JSON.stringify(user[i]));
                }


            }
        }
        const regex = /^\w+([.-]?\w+)*@[a-z]+([.-]?\w+)*(.\w{2,3})+$/;
        if (login.value.email.length == 0) {
            errorEmail.value.text = "Email không được để trống",
                errorEmail.value.status = true
        } else if (!regex.test(login.value.email)) {
            errorEmail.value.text = "Email không đúng định dạng",
                errorEmail.value.status = true
        } else if (login.value.email != emails) {
            errorEmail.value.text = "Email không đúng !",
                errorEmail.value.status = true
        } else if (regex.test(login.value.email) && login.value.email == emails) {
            successEmail.value.text = "Thành công!!";
            successEmail.value.status = true;
            errorEmail.value.status = false
        } else {
            errorEmail.value.text = "",
                errorEmail.value.status = false
        }
        if (login.value.password.length == 0) {
            errorPassword.value.text = "Mật khẩu không được để trống";
            errorPassword.value.status = true;
        } else if (login.value.password.length < 6) {
            errorPassword.value.text = "Mật khẩu phải đủ 6 kí tự";
            errorPassword.value.status = true;
        } else if (login.value.password != passwords) {
            errorPassword.value.text = "Mật khẩu không đúng",
                errorPassword.value.status = true

        } else if (login.value.password.length >= 6 && login.value.password == passwords) {
            successPassword.value.text = "Thành công!!";
            successPassword.value.status = true;
            errorPassword.value.status = false;
        } else {
            errorPassword.value.text = "";
            errorPassword.value.status = false;
        }
        if (roles != true) {
            alert("Tài khoản này không có!!!!")
            errorLogin.value.text = "Tài khoản này không có!!!!";
            // errorLogin.value.status = true
        }
        if (errorPassword.value.status == false && errorEmail.value.status == false && roles == true) {
            login.value.name = names;
            login.value.image = images;
            console.log(login.value);
            if (login.value) {
                localStorage.setItem('login', JSON.stringify(login.value));
            }
            createToast({
                title: 'Thành công',
                description: 'Đăng nhập thành công!!!!',
                type: 'success',
                timeout: 1000,

            })
            window.location.href = '/';
        }

    }

    return { onLogin, login, errorEmail, successEmail, errorPassword, successPassword }
}