<template>
  <!-- HEADER AREA START (header-5) -->
  <header class="ltn__header-area ltn__header-5 ltn__header-transparent gradient-color-4---">
    <!-- ltn__header-top-area start -->
    <div class="ltn__header-top-area">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <div class="ltn__top-bar-menu">
              <ul>
                <li>
                  <a href="locations.html"><i class="icon-placeholder"></i>238 Hoàng Quốc Việt, Cổ
                    Nhuế 1, Cầu Giấy, Hà Nội</a>
                </li>
                <li>
                  <a href="mailto:info@webmail.com?Subject=Flower%20greetings%20to%20you"><i class="icon-mail"></i>
                    bkap@gmail.com</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-md-5">
            <div class="top-bar-right text-right">
              <div class="ltn__top-bar-menu">
                <ul>
                  <li>
                    <!-- ltn__language-menu -->
                    <div class="ltn__drop-menu ltn__currency-menu ltn__language-menu">
                      <ul>
                        <li>
                          <a href="#" class="dropdown-toggle"><span class="active-currency">English</span></a>
                          <ul>
                            <li><a href="#">Arabic</a></li>
                            <li><a href="#">Bengali</a></li>
                            <li><a href="#">Chinese</a></li>
                            <li><a href="#">English</a></li>
                            <li><a href="#">French</a></li>
                            <li><a href="#">Hindi</a></li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li>
                    <!-- ltn__social-media -->
                    <div class="ltn__social-media">
                      <ul>
                        <li>
                          <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                        </li>
                        <li>
                          <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
                        </li>

                        <li>
                          <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                        </li>
                        <li>
                          <a href="#" title="Dribbble"><i class="fab fa-dribbble"></i></a>
                        </li>
                      </ul>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- ltn__header-top-area end -->

    <!-- ltn__header-middle-area start -->
    <div class="ltn__header-middle-area ltn__header-sticky ltn__sticky-bg-white sticky-active-into-mobile--- plr--9---">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="site-logo-wrap">
              <div class="site-logo">
                <a href="index-2.html"><img src="img/logo.png" alt="Logo" /></a>
              </div>
            </div>
          </div>
          <div class="col header-menu-column menu-color-white---">
            <div class="header-menu d-none d-xl-block">
              <nav>
                <div class="ltn__main-menu">
                  <ul>
                    <li class="menu-icon">
                      <router-link :to="{ name: 'Home' }">Trang Chủ</router-link>
                    </li>
                    <li class="menu-icon">
                      <router-link :to="{ name: 'Product' }">Sản Phẩm</router-link>
                    </li>
                    <li class="menu-icon">
                      <router-link :to="{ name: 'Blog' }">Blog</router-link>
                    </li>
                  </ul>
                </div>
              </nav>
            </div>
          </div>
          <div class="ltn__header-options ltn__header-options-2">
            <!-- header-search-1 -->
            <div class="header-search-wrap">
              <div class="header-search-1">
                <div class="search-icon">
                  <i class="icon-search for-search-show" @click="onToggle"></i>
                  <i v-on:click="choose" class="icon-cancel for-search-close" @click="onClose"
                    v-if="isShow == true"></i>
                </div>
              </div>
              <div class="header-search-1-form" v-if="isShow == true && isActive == false">
                <form id="#" method="get" action="#">
                  <input type="text" class="form-control form-input" name="search" placeholder="Tìm kiếm..."
                    v-model="query" />
                  <button type="submit">
                    <span><i class="icon-search"></i></span>
                  </button>
                </form>
                <div class="list-search" v-if="query">
                  <ul v-for="item in search" :key="item">
                    <li>
                      <router-link v-on:click="choose" :to="{ name: 'Detail', params: { id: item.id } }">{{ item.name
                      }}
                      </router-link>
                    </li>
                  </ul>
                </div>

              </div>
            </div>
            <!-- user-menu -->
            <div class="ltn__drop-menu user-menu">
              <ul>
                <li>
                  <a href="#"><i class="icon-user"></i></a>
                  <ul v-if="login">
                    <li>
                      <router-link :to="{ name: 'MyAccount' }">Tài khoản của tôi</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Favorite' }">Yêu Thích</router-link>
                    </li>
                  </ul>
                  <ul v-else>
                    <li>
                      <router-link :to="{ name: 'Login' }">Đăng Nhập</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Register' }">Đăng Ký</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Favorite' }">Yêu Thích</router-link>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
            <!-- mini-cart -->
            <div class="mini-cart-icon">
              <router-link :to="{ name: 'Cart' }" class="ltn__utilize-toggle">
                <i class="icon-shopping-cart"></i>
                <sup v-if="count">{{ count }}</sup>
                <sup v-else>0</sup>
              </router-link>
            </div>
            <!-- mini-cart -->
            <!-- Mobile Menu Button -->
            <div class="mobile-menu-toggle d-xl-none">
              <a href="#ltn__utilize-mobile-menu" class="ltn__utilize-toggle">
                <svg viewBox="0 0 800 600">
                  <path d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200"
                    id="top"></path>
                  <path d="M300,320 L540,320" id="middle"></path>
                  <path d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190"
                    id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318) "></path>
                </svg>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- ltn__header-middle-area end -->
  </header>
  <!-- HEADER AREA END -->
</template>
<style>
.list-search {
  position: fixed;
  background: #fff;
  width: 21%;
}

/* .active {
  display: block;
}

.noActive {
  display: none;
} */
/* .isActive{
  display: none;
} */
</style>
<script>
import store from '@/store';
import { ref } from '@vue/reactivity';
import { computed } from '@vue/runtime-core';
import AccountService from "@/services/AccountService";

export default {
  setup() {
    const product = computed(() => store.state.product);
    let login = JSON.parse(localStorage.getItem("login"));
    let user_name = ref("");
    if (login && store.state.cart) {
      user_name.value = login.name;
    }
    const query = ref("");
    const search = computed(() => {
      if (query.value) {
        return product.value.filter((product) => {
          return product.name.toLowerCase().indexOf(query.value.toLowerCase()) != -1;
        });
      } else {
        return product;
      }
    })
    const isShow = true;
    const isActive = ref(false);
    function choose() {
      query.value = '';
      isActive.value = false;
      isShow = true;
    }

    function onToggle() {
      // isShow = !isShow;
      isShow = false;
      isActive.value = true

    }
    function onClose() {
      query.value = '';
      isShow = true;
      isActive.value = false;
    }
    return { user_name, login, query, search, choose, isActive, isShow, onToggle, onClose }
  },
  computed: {
    count() {
      let login = JSON.parse(localStorage.getItem("login"));
      let names;
      if (store.state.cart) {
        for (let i = 0; i < store.state.cart.length; i++) {
          const element = store.state.cart[i];
          names = element.name_user
        }
      }

      if (store.state.cart && login && login.name == names) {
        return store.state.cart.length
      } 
      else {
        return 0
      }



    }

  },
  mounted() {
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
  }
}
</script>