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
                            <h1 class="section-title white-color">Chi Tiết Sản Phẩm</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li>
                                    <router-link :to="{ name: 'Home' }">Trang chủ</router-link>
                                </li>
                                <li>Chi Tiết Sản Phẩm</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- SHOP DETAILS AREA START -->
    <div class="ltn__shop-details-area pb-85">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="ltn__shop-details-inner mb-60">
                        <div class="row" v-if="prod">
                            <div class="col-md-6">
                                <div class="ltn__shop-details-img-gallery">
                                    <div class="ltn__shop-details-large-img">
                                        <div class="single-large-img">
                                            <a href="img/product/1.png">
                                                <img :src="'http://localhost:8080/uploads/' + prod.images" alt="Image">
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="modal-product-info shop-details-info pl-0">
                                    <div class="product-ratting">
                                        <ul>
                                            <star-rating :inline="true" :star-size="20" :read-only="true"
                                                :show-rating="false" :rating="vote"></star-rating>
                                        </ul>
                                    </div>
                                    <h3>{{ prod.name }}</h3>
                                    <div class="product-price" v-if="prod.salePrice == 0">
                                        <span>{{ formatPrice(prod.price) }}</span>
                                    </div>
                                    <div class="product-price" v-else>
                                        <span>{{ formatPrice(prod.salePrice) }}</span>
                                        <del>{{ formatPrice(prod.price) }}</del>
                                    </div>
                                    <div class="modal-product-meta ltn__product-details-menu-1">
                                        <ul>
                                            <li>
                                                <strong>Danh Mục:</strong>
                                                <span>
                                                    <a href="#">{{ prod.categoryId.name }}</a>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="ltn__product-details-menu-2">
                                        <ul>
                                            <li>
                                                <div class="cart-plus-minus">
                                                    <input type="button" value="-" class="cart-plus-minus-box"
                                                        v-on:click="onCountMinus()" style="border:none">
                                                    <input type="text" v-bind:value="`${count}`"
                                                        class="cart-plus-minus-box">
                                                    <input type="button" value="+" class="cart-plus-minus-box"
                                                        v-on:click="onCount()" style="border:none">
                                                </div>
                                            </li>
                                            <li>
                                                <a href="#" class="theme-btn-1 btn btn-effect-1" title="Add to Cart"
                                                    data-toggle="modal" data-target="#add_to_cart_modal" v-on:click.stop.prevent="onCart(prod.id)">
                                                    <i class="fas fa-shopping-cart"></i>
                                                    <span>Thêm Vào Giỏ Hàng</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="ltn__product-details-menu-3">
                                        <ul>
                                            <li>
                                                <a title="Wishlist"
                                                    v-on:click.stop.prevent="!this.ListFav.includes(prod.id) ? onFav(prod) : delFav(prod)">
                                                    <i v-bind:class="!this.ListFav.includes(prod.id) ? 'far fa-heart' : 'fas fa-heart'"
                                                        v-bind:style="!this.ListFav.includes(prod.id) ? { cursor: 'pointer' } : [{ color: 'red' }, { cursor: 'pointer' }]"></i>
                                                    <span v-if="!this.ListFav.includes(prod.id)">Thêm vào yêu
                                                        thích</span>
                                                    <span v-else>Đã yêu thích</span>
                                                </a>

                                            </li>
                                        </ul>
                                    </div>
                                    <hr>
                                    <div class="ltn__social-media">
                                        <ul>
                                            <li>Chia Sẻ:</li>
                                            <li><a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                                            <li><a href="#" title="Twitter"><i class="fab fa-twitter"></i></a></li>
                                            <li><a href="#" title="Linkedin"><i class="fab fa-linkedin"></i></a></li>
                                            <li><a href="#" title="Instagram"><i class="fab fa-instagram"></i></a></li>

                                        </ul>
                                    </div>
                                    <hr>
                                    <div class="ltn__safe-checkout">
                                        <h5>Thanh toán an toàn được đảm bảo</h5>
                                        <img src="../../public/img/icons/payment-2.png" alt="Payment Image">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Shop Tab Start -->
                    <div class="ltn__shop-details-tab-inner ltn__shop-details-tab-inner-2">
                        <div class="ltn__shop-details-tab-menu">
                            <div class="nav">
                                <a class="active show" data-toggle="tab" href="#liton_tab_details_1_1">Mô tả</a>
                                <a data-toggle="tab" href="#liton_tab_details_1_2" class="">Đáng giá</a>
                            </div>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="liton_tab_details_1_1">
                                <div class="ltn__shop-details-tab-content-inner">
                                    <h4 class="title-2">{{ prod.name }}</h4>
                                    <p>{{ prod.description }}</p>

                                </div>
                            </div>
                            <div class="tab-pane fade" id="liton_tab_details_1_2">
                                <div class="ltn__shop-details-tab-content-inner">
                                    <h4 class="title-2">Phản hồi khách hàng</h4>
                                    <div v-if="listRatings">
                                        <div class="product-ratting" v-for="comment in listRatings"
                                            :key="comment">
                                            <h4>{{ comment.accountId.name }}</h4>
                                            <ul>
                                                <star-rating :inline="true" :star-size="12" :read-only="true"
                                                    :show-rating="false" :rating="comment.star"></star-rating>
                                            </ul>
                                            <p>{{ comment.description }}</p>
                                        </div>
                                    </div>
                                    <div v-else>
                                        <div class="product-ratting" v-for="comment in listRate.slice(0, 2)"
                                            :key="comment">
                                            <h4>{{ comment.accountId.name }}</h4>
                                            <ul>
                                                <star-rating :inline="true" :star-size="12" :read-only="true"
                                                    :show-rating="false" :rating="comment.star"></star-rating>
                                            </ul>
                                            <p>{{ comment.description }}</p>
                                        </div>
                                    </div>

                                    <hr>

                                    <div class="ltn__comment-reply-area ltn__form-box mb-30">
                                        <form method="post" v-on:submit.prevent="onSubmitForm">
                                            <h4 class="title-2">Thêm đánh giá</h4>
                                            <div class="mb-30">
                                                <div class="add-a-review">
                                                    <h6>Xếp hạng:</h6>
                                                    <div class="product-ratting">
                                                        <star-rating v-model:rating="rating.star" :star-size="20"
                                                            :increment="0.5" :show-rating="false"></star-rating>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="input-item input-item-textarea ltn__custom-icon">
                                                <textarea placeholder="Nhập đánh giá của bạn...."
                                                    v-model="rating.description"></textarea>
                                            </div>

                                            <label class="mb-0"><input type="checkbox" name="agree"
                                                    v-model="rating.status" :value="true"> Lưu tên tôi,
                                                email và trang web trong trình duyệt này cho lần tiếp theo tôi nhận
                                                xét.</label>
                                            <div class="btn-wrapper">
                                                <button class="btn theme-btn-1 btn-effect-1 text-uppercase"
                                                    type="submit">Lưu</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Shop Tab End -->
                </div>
            </div>
        </div>
    </div>
    <!-- SHOP DETAILS AREA END -->

    <!-- PRODUCT SLIDER AREA START -->
    <div class="ltn__product-slider-area ltn__product-gutter pb-70">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title-area ltn__section-title-2">
                        <h1 class="section-title">Sản phẩm liên quan<span>.</span></h1>
                    </div>
                </div>
            </div>
            <div class="row ltn__related-product-slider-one-active slick-arrow-1">
                <!-- ltn__product-item -->
                <Carousel :itemsToShow="4">
                    <Slide v-for="item in product" :key="item">
                        <div class="carousel__item ltn__product-item ltn__product-item-3 text-center">
                            <div class="product-img">
                                <a href="#" tabindex="0"><img :src="'http://localhost:8080/uploads/' + item.images"
                                        style="width: 259px; height: 259px" alt="#"></a>

                                <div class="product-hover-action">
                                    <ul>
                                        <li>
                                            <router-link :to="{ name: 'Detail', params: { id: item.id } }"
                                                title="Quick View" data-toggle="modal" data-target="#quick_view_modal">
                                                <i class="far fa-eye"></i>
                                            </router-link>
                                        </li>
                                        <li>
                                            <a href="#" v-on:click.stop.prevent="onCart(item.id)">
                                                <i class="fas fa-shopping-cart"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a title="Wishlist"
                                                v-on:click.stop.prevent="!this.ListFav.includes(item.id) ? onFav(item) : delFav(item)">
                                                <i v-bind:class="!this.ListFav.includes(item.id) ? 'far fa-heart' : 'fas fa-heart'"
                                                    v-bind:style="!this.ListFav.includes(item.id) ? '' : { color: 'red' }"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-info" style="width: 258px; height: 124px">

                                <h2 class="product-title"><a href="#" tabindex="0">{{ item.name }}</a></h2>
                                <div class="product-price" v-if="item.salePrice == 0">
                                    <span>{{ formatPrice(item.price) }}</span>
                                </div>
                                <div class="product-price" v-else>
                                    <span>{{ formatPrice(item.salePrice) }}</span>
                                    <del>{{ formatPrice(item.price) }}</del>
                                </div>
                            </div>
                        </div>
                    </Slide>
                    <template #addons>
                        <Navigation />
                    </template>
                </Carousel>
                <!--  -->
            </div>
        </div>
    </div>
    <!-- PRODUCT SLIDER AREA END -->
</template>
<style>
.carousel__viewport {
    width: 1200px;
}
</style>
<script>
import AccountService from "../services/AccountService";
import FavoriteService from "@/services/FavoriteService";
import ProductService from '@/services/ProductService';
import RatingService from '@/services/RatingService';
import { Carousel, Navigation, Slide } from 'vue3-carousel';
import { store } from "../store";
import { computed } from 'vue';
import 'vue3-carousel/dist/carousel.css';
import StarRating from 'vue-star-rating'
// import "../../public/css/style.css"
// import "../../public/css/plugins.css"
// import "../../public/css/responsive.css"
// import "../../public/css/font-icons.css"

export default {
    data() {
        return {
            listRate: [],
            prod: null,
            product: null,
            catId: null,
            count: 1, data: {
                productId: null,
                accountId: null,
            },
            ListFav: [],
            vote: null,
            rating: {
                id: null,
                productId: "",
                accountId: "",
                star: "",
                description: "",
                status: "",
            },
            listRatings: []


        }

    },
    components: {
        Carousel,
        Slide,
        Navigation,
        StarRating
    },
    created() {
        RatingService.getAll().then((res) => {
            for (let index = 0; index < res.data.length; index++) {
                const element = res.data[index];
                if (element.productId.id == this.$route.params.id) {
                    this.listRate.push(element);
                }
            }
        }).catch(() => { }).finally(() => { });
        RatingService.getStar(this.$route.params.id).then((res) => {
            // console.log(res);
            this.vote = res.data;
        });
        ProductService.get(this.$route.params.id)
            .then((response) => {
                this.prod = response.data;
                this.catId = response.data.categoryId.id
                ProductService.getCat(this.prod.categoryId.id)
                    .then((response) => {
                        this.product = response.data;
                    })
                    .catch((errors) => {
                        console.log(errors);
                    });
            })
            .catch((errors) => {
                console.log(errors);
            });
        const acc = JSON.parse(localStorage.getItem("account"));
        if (acc != null) {
            AccountService.get(acc.id)
                .then((res) => {
                    this.data.accountId = res.data;
                })
                .catch((error) => {
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });
            FavoriteService.getAll()
                .then((res) => {
                    for (let index = 0; index < res.data.length; index++) {
                        const element = res.data[index];
                        if (element.accountId.id == this.data.accountId.id) {
                            this.ListFav.push(element.productId.id);

                        }

                    }
                })
                .catch((error) => {
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });
        }
    },

    methods: {
        formatPrice(value) {
            return new Intl.NumberFormat('en-US').format(value);
        },
        onCount() {
            this.count += 1
        },
        onCountMinus() {
            if (this.count > 0) {
                this.count -= 1
            }
        },

        onFav(item) {
            const acc = JSON.parse(localStorage.getItem("account"));
            if (acc) {
                this.data.productId = item;
                FavoriteService.create(this.data).then((res) => {
                    this.ListFav.push(item.id);

                }).catch((error) => {
                    console.log(error);
                }).finally(() => { });
            } else {
                if (confirm("Hãy đăng nhập để thêm sản phẩm yêu thích!!!!")) {
                    router.push('login');
                }
            }

        },
        delFav(item) {
            FavoriteService.getAll()
                .then((res) => {
                    for (let index = 0; index < res.data.length; index++) {
                        const element = res.data[index];
                        if (element.accountId.id == this.data.accountId.id && element.productId.id == item.id) {
                            FavoriteService.delete(element.id).then((res) => {
                                this.ListFav.splice(
                                    this.ListFav.findIndex((e) => e == item.id),
                                    1
                                )
                            }).catch((err) => { }).finally(() => { });

                        }

                    }

                })
                .catch((error) => {
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });

        },
        onSubmitForm() {
            const acc = JSON.parse(localStorage.getItem("account"));
            this.rating.productId = this.prod;
            this.rating.accountId = acc;
            if (acc) {
                RatingService.create(this.rating).then((res) => {
                    console.log(res.data);
                    this.listRatings.push(res.data)
                    this.rating.star = "",
                    this.raitng.description = " ";

                }).catch(() => { }).finally(() => { });
            } else {
                if (confirm("Hãy đăng nhập để nhận xét về sản phẩm này!!!!")) {
                    router.push('login');
                }
            }

        }


    },
    setup() {
        const product = computed(() => store.state.product);
        console.log(product);
        store.dispatch('fetchProduct');
        function onCart(itemId) {
            console.log(itemId);
            store.commit('onCart', itemId);
        }
        return { product, onCart }
    }
}
</script>