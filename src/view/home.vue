<template>
  <div class="ltn__utilize-overlay"></div>
  <!-- SLIDER AREA START (slider-3) -->
  <div class="ltn__slider-area ltn__slider-3 section-bg-1">
    <div class="ltn__slide-one-active slick-slide-arrow-1 slick-slide-dots-1">
      <!-- ltn__slide-item -->
      <div class="ltn__slide-item ltn__slide-item-2 ltn__slide-item-3">
        <div class="ltn__slide-item-inner">
          <Carousel :wrapAround="true">
            <Slide v-for="item in banner" :key="item">
              <div class="container">
                <div class="row">
                  <div class="col-lg-12 align-self-center">
                    <div class="slide-item-info">
                      <div class="slide-item-info-inner ltn__slide-animation">
                        <div class="slide-video mb-50 d-none">
                          <a class="ltn__video-icon-2 ltn__video-icon-2-bo rder"
                            href="https://www.youtube.com/embed/ATI7vfCgwXE?autoplay=1&amp;showinfo=0"
                            data-rel="lightcase:myCollection">
                            <i class="fa fa-play"></i>
                          </a>
                        </div>
                        <h6 class="slide-sub-title animated">
                          <img src="img/icons/icon-img/1.png" alt="#" /> 100%
                          Sản phẩm chính hãng
                        </h6>
                        <h1 class="slide-title animated">
                          {{ item.name }}
                        </h1>
                        <div class="btn-wrapper animated">
                          <a href="shop.html" class="theme-btn-1 btn btn-effect-1 text-uppercase">Khám phá sản phẩm</a>
                        </div>
                      </div>
                    </div>
                    <div class="slide-item-img">
                      <img :src="'http://localhost:8080/uploads/' + item.images" alt="#" />
                    </div>
                  </div>
                </div>
              </div>
            </Slide>

            <template #addons>
              <Navigation />
            </template>
          </Carousel>
        </div>
      </div>
    </div>
  </div>
  <!-- SLIDER AREA END -->

  <!-- BANNER AREA START -->
  <div class="ltn__banner-area mt-120">
    <div class="container">
      <div class="row ltn__custom-gutter--- justify-content-center">
        <div class="col-lg-6 col-md-6">
          <div class="ltn__banner-item">
            <div class="ltn__banner-img">
              <a href="shop.html"><img src="img/banner/13.png" alt="Banner Image" /></a>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-6">
          <div class="row">
            <div class="col-lg-12">
              <div class="ltn__banner-item">
                <div class="ltn__banner-img">
                  <a href="shop.html"><img src="img/banner/14.png" alt="Banner Image" /></a>
                </div>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="ltn__banner-item">
                <div class="ltn__banner-img">
                  <a href="shop.html"><img src="img/banner/15.png" alt="Banner Image" /></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- BANNER AREA END -->

  <!-- PRODUCT TAB AREA START (product-item-3) -->
  <div class="ltn__product-tab-area ltn__product-gutter pt-85 pb-70">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-title-area ltn__section-title-2 text-center">
            <h1 class="section-title">Sản Phẩm Của Chúng Tôi</h1>
          </div>
          <div class="ltn__tab-menu ltn__tab-menu-2 ltn__tab-menu-top-right-- text-uppercase text-center">
            <div class="nav" v-for="(item) in category" :key="item">
              <a class="show" data-toggle="tab" href="#" v-on:click="onCate(item.id)">{{ item.name }}</a>
              <!-- <a data-toggle="tab" href="#liton_tab_3_2" class="">Vegetables</a> -->
              <!-- <a data-toggle="tab" href="#liton_tab_3_3" class=""
                >Dried Foods</a
              >
              <a data-toggle="tab" href="#liton_tab_3_4" class=""
                >Bread & Cake</a
              >
              <a data-toggle="tab" href="#liton_tab_3_5" class=""
                >Fish & Meat</a
              > -->
            </div>
          </div>

          <div class="col-md-12">
            <div class="row" v-if="productCate">
              <div class="col-lg-3 col-md-4 col-sm-6 col-6" v-for="item in productCate" :key="item">
                <div class="ltn__product-item ltn__product-item-3 text-center">
                  <div class="product-img">
                    <a href="#"><img :src="'http://localhost:8080/uploads/' + item.images"
                        style="width: 259px; height: 259px" alt="#" /></a>
                    <div class="product-hover-action">
                      <ul>
                        <li>
                          <a href="#" title="Quick View" data-toggle="modal" data-target="#quick_view_modal">
                            <i class="far fa-eye"></i>
                          </a>
                        </li>
                        <li>
                          <a   title="Add to Cart" data-toggle="modal" data-target="#add_to_cart_modal" v-on:click.stop.prevent="onCart(item.id)">
                            <i class="fas fa-shopping-cart"></i>
                          </a>
                        </li>
                        <li>
                          <a href="#" title="Wishlist" data-toggle="modal" data-target="#liton_wishlist_modal">
                            <i class="far fa-heart"></i></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="product-info" style="width: 258px; height: 166px">
                    <div class="product-ratting">
                      <ul>
                        <li>
                          <a href="#"><i class="fas fa-star"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fas fa-star"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fas fa-star"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fas fa-star-half-alt"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="far fa-star"></i></a>
                        </li>
                        <li class="review-total">
                          <a href="#"> (24)</a>
                        </li>
                      </ul>
                    </div>
                    <h2 class="product-title">
                      <a href="#">{{ item.name }}</a>
                    </h2>
                    <div class="product-price" v-if="item.salePrice == 0">
                      <span>{{ formatPrice(item.price) }}đ</span>
                    </div>
                    <div class="product-price" v-else>
                      <span>{{ formatPrice(item.salePrice) }}đ</span>
                      <del>{{ formatPrice(item.price) }}đ</del>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row" v-else>
              <div class="col-lg-3 col-md-4 col-sm-6 col-6" v-for="item in product" :key="item">
                <div class="ltn__product-item ltn__product-item-3 text-center">
                  <div class="product-img">
                    <a href="#"><img :src="'http://localhost:8080/uploads/' + item.images"
                        style="width: 259px; height: 259px" alt="#" /></a>
                    <div class="product-hover-action">
                      <ul>
                        <li>
                          <a href="#" title="Quick View" data-toggle="modal" data-target="#quick_view_modal">
                            <i class="far fa-eye"></i>
                          </a>
                        </li>
                        <li>
                          <a  href="#" title="Add to Cart" data-toggle="modal" data-target="#add_to_cart_modal" v-on:click.stop.prevent="onCart(item.id)">
                            <i class="fas fa-shopping-cart"></i>
                          </a>
                        </li>
                        <li>
                          <a href="#" title="Wishlist" data-toggle="modal" data-target="#liton_wishlist_modal">
                            <i class="far fa-heart"></i></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="product-info" style="width: 258px; height: 166px">
                    <div class="product-ratting">
                      <ul>
                        <li>
                          <a href="#"><i class="fas fa-star"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fas fa-star"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fas fa-star"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fas fa-star-half-alt"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="far fa-star"></i></a>
                        </li>
                        <li class="review-total">
                          <a href="#"> (24)</a>
                        </li>
                      </ul>
                    </div>
                    <h2 class="product-title">
                      <a href="#">{{ item.name }}</a>
                    </h2>
                    <div class="product-price" v-if="item.salePrice == 0">
                      <span>{{ formatPrice(item.price) }}đ</span>
                    </div>
                    <div class="product-price" v-else>
                      <span>{{ formatPrice(item.salePrice) }}đ</span>
                      <del>{{ formatPrice(item.price) }}đ</del>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- </div> -->
  <!-- PRODUCT TAB AREA END -->

  <!-- COUNTDOWN AREA START -->
  <div class="ltn__call-to-action-area ltn__call-to-action-4 section-bg-1 pt-110 pb-120">
    <div class="container">
      <div class="row">
        <div class="col-lg-5">
          <img src="img/banner/11.png" alt="#" />
        </div>
        <div class="col-lg-7">
          <div class="call-to-action-inner call-to-action-inner-4 text-color-white--- text-center---">
            <div class="section-title-area ltn__section-title-2 text-center---">
              <h6 class="ltn__secondary-color">Ưu đãi hấp dẫn</h6>
              <h1 class="section-title">
                Đăng Ký Tài Khoản
              </h1>
            </div>
            <div class="ltn__countdown ltn__countdown-3 bg-white--" data-countdown="2021/12/28"></div>
            <div class="btn-wrapper animated">
              <a href="#" class="theme-btn-1 btn btn-effect-1 text-uppercase">Đăng Ký</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- COUNTDOWN AREA END -->

  <!-- PRODUCT AREA START (product-item-3) -->
  <div class="ltn__product-area ltn__product-gutter pt-115 pb-70">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-title-area ltn__section-title-2 text-center">
            <h1 class="section-title">Sản Phẩm Khuyến Mãi</h1>
          </div>
        </div>
      </div>
      <div class="row ltn__tab-product-slider-one-active--- slick-arrow-1" v-if="productSale">
        <!-- ltn__product-item -->
        <div class="col-lg-3 col-md-4 col-sm-6 col-6" v-for="item in productSale" :key="item">
          <div class="ltn__product-item ltn__product-item-3 text-left">
            <div class="product-img">
              <a href="#"><img :src="'http://localhost:8080/uploads/' + item.images" alt="#"
                  style="width: 259px; height: 259px" /></a>
              <div class="product-hover-action">
                <ul>
                  <li>
                    <a href="#" title="Quick View" data-toggle="modal" data-target="#quick_view_modal">
                      <i class="far fa-eye"></i>
                    </a>
                  </li>
                  <li>
                    <a  title="Add to Cart" data-toggle="modal" data-target="#add_to_cart_modal" v-on:click.stop.prevent="onCart(item.id)">
                      <i class="fas fa-shopping-cart"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#" title="Wishlist" data-toggle="modal" data-target="#liton_wishlist_modal">
                      <i class="far fa-heart"></i></a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="product-info" style="width: 258px; height: 166px">
              <div class="product-ratting">
                <ul>
                  <li>
                    <a href="#"><i class="fas fa-star"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-star"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-star"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-star-half-alt"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="far fa-star"></i></a>
                  </li>
                </ul>
              </div>
              <h2 class="product-title">
                <a href="#">{{ item.name }}</a>
              </h2>
              <div class="product-price" v-if="item.salePrice == 0">
                <span>{{ formatPrice(item.price) }}đ</span>
              </div>
              <div class="product-price" v-else>
                <span>{{ formatPrice(item.salePrice) }}đ</span>
                <del>{{ formatPrice(item.price) }}đ</del>
              </div>
            </div>
          </div>
        </div>
        <!--  -->
      </div>
    </div>
  </div>
  <!-- PRODUCT AREA END -->
  <!-- VIDEO AREA START -->
  <div class="ltn__video-popup-area ltn__video-popup-margin">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="ltn__video-bg-img ltn__video-popup-height-600 bg-overlay-black-10-- bg-image"
            data-bg="img/bg/15.jpg">
            <a class="ltn__video-icon-2 ltn__video-icon-2-border"
              href="https://www.youtube.com/embed/B_0J3iBRK3A"
              data-rel="lightcase:myCollection">
              <i class="fa fa-play"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- VIDEO AREA END -->

  <!-- BLOG AREA START (blog-3) -->
  <div class="ltn__blog-area  pb-70" style="padding-top:331px">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-title-area ltn__section-title-2 text-center">
            <h1 class="section-title white-color---">Blog mới nhất</h1>
          </div>
        </div>
      </div>
      <div class="row ltn__blog-slider">
        <!-- <div class="ltn__blog-slider-one-active slick-arrow-1 ltn__blog-item-3-normal"> -->
        <Carousel :itemsToShow="3" :wrapAround="true">
          <Slide v-for="item in blog" :key="item">
            <div class="carousel__item ltn__blog-slider-one-active slick-arrow-1 ltn__blog-item-3-normal"
              style="padding: 8px;">
              <div class="ltn__blog-item ltn__blog-item-3">
                <div class="ltn__blog-img">
                  <a href="#"><img :src="'http://localhost:8080/uploads/' + item.images" alt="#" /></a>
                </div>
                <div class="ltn__blog-brief" style="height: 275px;">
                  <div class="ltn__blog-meta">
                    <ul>
                      <li class="ltn__blog-author">
                        <a href="#"><i class="far fa-user"></i>Bởi: Admin</a>
                      </li>
                      <li class="ltn__blog-tags">
                        <a href="#"><i class="fas fa-tags"></i>Dịch vụ</a>
                      </li>
                    </ul>
                  </div>
                  <h3 class="ltn__blog-title">
                    <a href="#">{{ item.name }}</a>
                  </h3>
                  <div class="ltn__blog-meta-btn">
                    <div class="ltn__blog-meta">
                      <ul>
                        <li class="ltn__blog-date">
                          <i class="far fa-calendar-alt"></i>Ngày 24 tháng 6 năm 2020
                        </li>
                      </ul>
                    </div>
                    <div class="ltn__blog-btn">
                      <a href="#">Đọc thêm</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </Slide>
          <template #addons>
            <Navigation />
          </template>
        </Carousel>
        <!-- </div> -->
        <!-- Blog Item -->
      </div>
    </div>
  </div>

  <!-- BLOG AREA END -->
</template>
<style>
.carousel__prev {
  border-radius: 0px;
  background-color: #fff;
  transform: translate(-50%, -50%);
  cursor: pointer;
  position: absolute;
  top: 50%;
  left: 33px;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  width: 60px;
  height: 60px;
  line-height: 58px;
  border: 1px solid var(--border-color-1);
  text-align: center;
  font-size: 20px;
  color: #071c1f !important;
  z-index: 1;
  opacity: 0;
}

.slick-slide-arrow-1.carousel__prev:hover {
  background-color: #80b500;
  border-color: #80b500;
  color: #fff !important;
}

.slick-slide-arrow-1 .carousel__prev:hover {
  background-color: var(--ltn__secondary-color);
  border-color: var(--ltn__secondary-color);
  color: var(--white) !important;
}

.slick-slide-arrow-1:hover .carousel__prev {
  opacity: 1;
  visibility: visible;
  left: 55px;
}

.carousel__icon {
  width: 2.2em;
}

.carousel__next {
  border-radius: 0px;
  background-color: #fff;
  right: -83px !important;
  transform: translate(-50%, -50%);
  cursor: pointer;
  position: absolute;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  width: 60px;
  height: 60px;
  line-height: 58px;
  border: 1px solid var(--border-color-1);
  text-align: center;
  font-size: 20px;
  color: #071c1f !important;
  z-index: 1;
  opacity: 0;
}

.slick-slide-arrow-1.carousel__next:hover {
  background-color: #80b500;
  border-color: #80b500;
  color: #fff !important;
}

.slick-slide-arrow-1 .carousel__next:hover {
  background-color: #80b500;
  border-color: #80b500;
  color: #fff !important;
}

.slick-slide-arrow-1:hover .carousel__next {
  opacity: 1;
  visibility: visible;
}

.ltn__blog-slider.carousel__prev {
  background-color: var(--white);
  cursor: pointer;
  position: absolute;
  top: 50%;
  left: 15px;
  right: auto;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  width: 50px;
  height: 50px;
  line-height: 48px;
  display: block;
  border: 1px solid var(--white-4);
  border-radius: 100% !important;
  text-align: center;
  font-size: 20px;
  color: var(--ltn__primary-color) !important;
  z-index: 1;
  opacity: 0;
  visibility: hidden;
}

.ltn__blog-slider.carousel__prev:hover {
  background-color: #80b500;
  border-color: #80b500;
  color: #fff !important;
}

.ltn__blog-slider .carousel__prev:hover {
  background-color: var(--ltn__secondary-color);
  border-color: var(--ltn__secondary-color);
  color: var(--white) !important;
}

.ltn__blog-slider:hover .carousel__prev {
  opacity: 1;
  visibility: visible;
  left: -79px;
  border-radius: 100%;
  display: none;
}
.ltn__blog-slider:hover .carousel__next {
  opacity: 1;
  visibility: visible;
  border-radius: 100%;
}
.ltn__blog-slider.carousel__next:hover {
  background-color: #80b500;
  border-color: #80b500;
  color: #fff !important;
}

.ltn__blog-slider .carousel__next:hover {
  background-color: var(--ltn__secondary-color);
  border-color: var(--ltn__secondary-color);
  color: var(--white) !important;
}
</style>
<script>
import ProductService from "@/services/ProductService";
import { Carousel, Navigation, Slide } from "vue3-carousel";
import "vue3-carousel/dist/carousel.css";
import BannerService from "../services/BannerService";
import CategoryService from "../services/CategoryService";
import { store } from "../store";
import { computed, ref } from 'vue';
import BlogService from "@/services/BlogService";
export default {
  components: {
    Carousel,
    Slide,
    Navigation,
  },
  data() {
    return {
      banner: null,
      category: null,
      blog: null,
      // productSale: null
    }

  },

  created() {
    BannerService.getAll()
      .then((res) => {
        this.banner = res.data;
      })
      .catch((error) => {
        console.log(error);
      })
      .finally(() => {
        //Perform action in always
      });
    CategoryService.getAll()
      .then((res) => {
        this.category = res.data;
      })
      .catch((error) => {
        console.log(error);
      })
      .finally(() => {
        //Perform action in always
      });
    BlogService.getAll()
      .then((res) => {
        this.blog = res.data;
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
      let val = (value / 1).toFixed(2).replace('.', ',')
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    },


  },
  setup() {
    const product = computed(() => store.state.product);
    console.log(product);
    store.dispatch('fetchProduct');
    const productSale = computed(() => store.state.productSale);
    store.dispatch('fetchProductSale');
    const productCate = ref(null);
    function onCate(id) {
      console.log(id);
      ProductService.getCat(id)
        .then((response) => {
          productCate.value = response.data;
          console.log(productCate.value);
        })
        .catch((errors) => {
          console.log(errors);
        });
    }
    function onCart(itemId) {
            console.log(itemId);
            // if(user == null){
            //     router.replace({ name: "Login" });
            // }
            store.commit('onCart', itemId);
        }
    return { product, productSale, onCate, productCate,onCart }
  }

};
</script>
