<template>

    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-overlay-theme-black-90 bg-image plr--9---"
        data-bg="img/bg/9.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                        <div class="section-title-area ltn__section-title-2">
                            <h1 class="section-title white-color">Sản Phẩm</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li>
                                    <router-link :to="{ name: 'Home' }">Trang chủ</router-link>
                                </li>
                                <li>Sản Phẩm</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- PRODUCT DETAILS AREA START -->
    <div class="ltn__product-area ltn__product-gutter mb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__shop-options">
                        <ul>
                            <li>
                                <div class="ltn__grid-list-tab-menu ">
                                    <div class="nav">
                                        <a class="active show" data-toggle="tab" href="#liton_product_grid"><i
                                                class="fas fa-th-large"></i></a>
                                        <a data-toggle="tab" href="#liton_product_list"><i class="fas fa-list"></i></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="liton_product_grid">
                            <div class="ltn__product-tab-content-inner ltn__product-grid-view">
                                <div class="row" v-if="paginated">
                                    <!-- ltn__product-item -->
                                    <div class="col-xl-3 col-lg-4 col-sm-6 col-6" v-for="item in paginated" :key="item">
                                        <div class="ltn__product-item ltn__product-item-3 text-center">
                                            <div class="product-img">
                                                <a href="#"><img :src="'http://localhost:8080/uploads/' + item.images"
                                                        style="width: 259px; height: 259px" alt="#"></a>
                                                <div class="product-hover-action">
                                                    <ul>
                                                        <li>
                                                            <router-link
                                                                :to="{ name: 'Detail', params: { id: item.id } }">
                                                                <i class="far fa-eye"></i>
                                                            </router-link>
                                                        </li>
                                                        <li>
                                                            <a href="#" title="Add to Cart" data-toggle="modal"
                                                                data-target="#add_to_cart_modal"
                                                                v-on:click.stop.prevent="onCart(item.id)">
                                                                <i class="fas fa-shopping-cart"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Wishlist"
                                                                v-on:click.stop.prevent="!this.ListFav.includes(item.id) ? onFav(item) : delFav(item)">
                                                                <i v-bind:class="!this.ListFav.includes(item.id) ? 'far fa-heart' : 'fas fa-heart'"
                                                                    v-bind:style="!this.ListFav.includes(item.id) ? { cursor: 'pointer' } : [{ color: 'red' }, { cursor: 'pointer' }]"></i></a>

                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-info" style="width: 258px; height: 124px">

                                                <h2 class="product-title"><a href="#">{{ item.name }}</a></h2>
                                                <div class="product-price" v-if="item.salePrice == 0">
                                                    <span>{{ formatPrice(item.price) }}</span>
                                                </div>
                                                <div class="product-price" v-else>
                                                    <span>{{ formatPrice(item.salePrice) }}</span>
                                                    <del>{{ formatPrice(item.price) }}</del>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="liton_product_list">
                            <div class="ltn__product-tab-content-inner ltn__product-list-view">
                                <div class="row">
                                    <!-- ltn__product-item -->
                                    <div class="col-lg-12" v-for="item in product" :key="item">
                                        <div class="ltn__product-item ltn__product-item-3">
                                            <div class="product-img">
                                                <a href="product-details.html"><img
                                                        :src="'http://localhost:8080/uploads/' + item.images" alt="#"
                                                        style="width:525px; height:525px"></a>

                                            </div>
                                            <div class="product-info">
                                                <h2 class="product-title"><a href="#">{{ item.name }}</a></h2>

                                                <div class="product-price" v-if="item.salePrice == 0">
                                                    <span>{{ formatPrice(item.price) }}</span>
                                                </div>
                                                <div class="product-price" v-else>
                                                    <span>{{ formatPrice(item.salePrice) }}</span>
                                                    <del>{{ formatPrice(item.price) }}</del>
                                                </div>
                                                <div class="product-brief">
                                                    <p>{{ item.description }}</p>
                                                </div>
                                                <div class="product-hover-action">
                                                    <ul>
                                                        <li>
                                                            <a href="#" title="Quick View" data-toggle="modal"
                                                                data-target="#quick_view_modal">
                                                                <i class="far fa-eye"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <!-- data-toggle="modal"
                                                                data-target="#add_to_cart_modal" -->
                                                            <a href="#" title="Add to Cart"
                                                                v-on:click.stop.prevent="onCart(item.id)">
                                                                <i class="fas fa-shopping-cart"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a title="Wishlist"
                                                                v-on:click.stop.prevent="!this.ListFav.includes(item.id) ? onFav(item) : delFav(item)">
                                                                <i v-bind:class="!this.ListFav.includes(item.id) ? 'far fa-heart' : 'fas fa-heart'"
                                                                    v-bind:style="!this.ListFav.includes(item.id) ? { cursor: 'pointer' } : [{ color: 'red' }, { cursor: 'pointer' }]"></i></a>

                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ltn__pagination-area text-center">
                        <div class="ltn__pagination" v-if="totalPaginate > 1">
                            <ul>
                                <li><a href="#" @click="prev"><i class="fas fa-angle-double-left"></i></a></li>
                                <li v-for="item in totalPaginate" :key="item"
                                  v-bind:class="{ isActive: (item  === current), 'text-dark': isActive == false }"><a href="#"
                                        v-on:click.prevent="onCurrent(item)">{{ item }} </a></li>
                                <li><a href="#" @click="next"><i class="fas fa-angle-double-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- PRODUCT DETAILS AREA END -->
</template>
<style>
.isActive {
    background-color: #80b500;
    color: #ffff;
}

</style>
<script>
import AccountService from "../services/AccountService";
import FavoriteService from "@/services/FavoriteService";
import { store } from "../store";
import { computed } from 'vue';
export default {
    data() {
        return {
            current: 1,
            pageSize: 12,
            data: {
                productId: null,
                accountId: null,
            },
            ListFav: [],
            isActive: false,
            hasError: false
        }
    },

    created() {
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
                    console.log(this.ListFav);
                })
                .catch((error) => {
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });
        }
    },
    computed: {
        product() {
            return store.state.product
        },
        resultCount() {
            return this.product && this.product.length
        },
        indexStart() {
            return (this.current - 1) * this.pageSize;
        },
        indexEnd() {
            return this.indexStart + this.pageSize;
        },
        totalPaginate() {
            if (this.resultCount % this.pageSize == 0) {
                return Math.floor(this.resultCount / this.pageSize);
            } else {
                return Math.floor(this.resultCount / this.pageSize) + 1;
            }
        },
        paginated() {
            console.log(this.resultCount);
            if (this.resultCount > this.pageSize) {
                return this.product.slice(this.indexStart, this.indexEnd, this.totalPaginate);
            }
            else {
                return this.product;
            }
        }
    },

    methods: {
        formatPrice(value) {
            return new Intl.NumberFormat('en-US').format(value);
        },
        onCurrent(item) {
            this.isActive = true;
            return this.current = item;

        },

        prev() {
            this.current--;
            if (this.current == 0) {
                return this.current = 1;
            }
        },
        next() {
            this.current++;
            if (this.current > this.totalPaginate) {
                return this.current = this.totalPaginate;
            }
        }
        , onFav(item) {
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
        }
    },
    setup() {
        store.dispatch('fetchProduct');
        function onCart(itemId) {
            console.log(itemId);
            store.commit('onCart', itemId);
        }
        return {
            // product,
            onCart
        }
    }
}
</script>