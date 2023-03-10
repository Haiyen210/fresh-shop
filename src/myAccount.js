import { ref } from '@vue/reactivity';
import AccountService from './services/AccountService';
import router from '@/router';
export default function() {
    const user = JSON.parse(localStorage.getItem("login"));
    const orders = JSON.parse(localStorage.getItem("order"));
    const account = JSON.parse(localStorage.getItem("checkRegister"));
    let element;
    const oldPassword = ref("");
    const newPassWord = ref("");
    const confirmPassword = ref("");
    const oldPasswordError = ref({
        text: "",
        status: false,
    })
    const oldPasswordSuccess = ref({
        text: "",
        status: false,
    })
    const newPasswordError = ref({
        text: "",
        status: false,
    })
    const newPasswordSuccess = ref({
        text: "",
        status: false,
    })
    const confirmPasswordError = ref({
        text: "",
        status: false,
    })
    const confirmPasswordSuccess = ref({
        text: "",
        status: false,
    })
    if (user) {
        for (let i = 0; i < account.length; i++) {
            if (account[i].email == user.email) {
                element = account[i];
            }
        }
    }


    function onAccount() {
        if (oldPassword.value.length == 0) {
            oldPasswordError.value.text = "Mật khẩu không được để trống"
            oldPasswordError.value.status = true
        } else if (oldPassword.value.length < 6) {
            oldPasswordError.value.text = "Mật khẩu phải từ 6 kí tự trở lên"
            oldPasswordError.value.status = true
        } else if (oldPassword.value != element.password) {
            oldPasswordError.value.text = "Mật khẩu không đúng"
            oldPasswordError.value.status = true
        } else if (oldPassword.value.length >= 6 && oldPassword.value == element.password) {
            oldPasswordSuccess.value.text = ""
            oldPasswordSuccess.value.status = true
            oldPasswordError.value.status = false
        } else {
            oldPasswordError.value.text = ""
            oldPasswordError.value.status = false
        }

        if (newPassWord.value.length == 0) {
            newPasswordError.value.text = "Mật khẩu không được để trống"
            newPasswordError.value.status = true
        } else if (newPassWord.value.length < 6) {
            newPasswordError.value.text = "Mật khẩu phải từ 6 kí tự trở lên"
            newPasswordError.value.status = true
        } else if (newPassWord.value.length >= 6) {
            newPasswordSuccess.value.text = ""
            newPasswordSuccess.value.status = true
            newPasswordError.value.status = false
        } else {
            newPasswordError.value.text = ""
            newPasswordError.value.status = false
        }

        if (confirmPassword.value.length == 0) {
            confirmPasswordError.value.text = "Mật khẩu không được để trống"
            confirmPasswordError.value.status = true
        } else if (confirmPassword.value.length < 6) {
            confirmPasswordError.value.text = "Mật khẩu phải từ 6 kí tự trở lên"
            confirmPasswordError.value.status = true
        } else if (confirmPassword.value != newPassWord.value) {
            confirmPasswordError.value.text = "Mật khẩu không khớp!!"
            confirmPasswordError.value.status = true
        } else if (confirmPassword.value.length >= 6 && confirmPassword.value == newPassWord.value) {
            confirmPasswordSuccess.value.text = ""
            confirmPasswordSuccess.value.status = true
            confirmPasswordError.value.status = false
        } else {
            confirmPasswordError.value.text = ""
            confirmPasswordError.value.status = false
        }

        if (oldPasswordSuccess.value.status == true && newPasswordSuccess.value.status == true && confirmPasswordSuccess.value.status == true) {
            if (newPassWord.value) {
                element.password = newPassWord.value;
            } else {
                element.password
            }
            AccountService.update(element).then((res) => {
                console.log(res);
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
            }).catch((error) => {
                console.error(error);
            }).finally(() => {})
            localStorage.removeItem('login');
            localStorage.removeItem('account');
            router.push('/login');
        }
    }

    function onLogout() {
        localStorage.removeItem('login');
        localStorage.removeItem('account')
        window.location.href = '/login';
    }
    console.log(element);
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
        onLogout
    }
}