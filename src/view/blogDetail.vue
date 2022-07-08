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
                            <h1 class="section-title white-color">Chi Tiết Blog</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Chi Tiết Blog</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->
    <!-- PAGE DETAILS AREA START (blog-details) -->
    <div class="ltn__page-details-area ltn__blog-details-area mb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="ltn__blog-details-wrap">
                        <div class="ltn__page-details-inner ltn__blog-details-inner">
                            <h2 class="ltn__blog-title">{{ blogDetail.name }}</h2>
                            <div class="ltn__blog-meta">
                                <ul>
                                    <li class="ltn__blog-date">
                                        <i class="far fa-calendar-alt"></i>Ngày 22 tháng 6 năm 2020
                                    </li>
                                    <li>
                                        <a href="#"><i class="far fa-comments"></i>35 Bình Luận</a>
                                    </li>
                                </ul>
                            </div>
                            <p>{{ blogDetail.description }}</p>

                            <img :src="'http://localhost:8080/uploads/' + blogDetail.images" alt="Image">
                            <p>{{ blogDetail.description }}</p>


                        </div>
                        <hr>
                        <!-- comment-reply -->
                        <div class="ltn__comment-reply-area ltn__form-box mb-10">
                            <h4 class="title-2">Bình luận</h4>
                            <form action="#">
                                <div class="input-item input-item-textarea ltn__custom-icon">
                                    <textarea placeholder="Nhập nhận xét của bạn...."></textarea>
                                </div>
                                <div class="input-item input-item-name ltn__custom-icon">
                                    <input type="text" placeholder="Nhập tên của bạn....">
                                </div>
                                <div class="input-item input-item-email ltn__custom-icon">
                                    <input type="email" placeholder="Nhập email của bạn....">
                                </div>
                                <div class="input-item input-item-website ltn__custom-icon">
                                    <input type="text" name="website" placeholder="Nhập trang web của bạn....">
                                </div>
                                <label class="mb-0 input-info-save"><input type="checkbox" name="agree">
                                    Lưu tên tôi,
                                    email và trang web trong trình duyệt này cho lần tiếp theo tôi nhận xé</label>
                                <div class="btn-wrapper">
                                    <button class="btn theme-btn-1 btn-effect-1 text-uppercase" type="submit"><i
                                            class="far fa-comments"></i>Đăng Bình Luận</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <aside class="sidebar-area blog-sidebar ltn__right-sidebar">
                        <!-- Search Widget -->
                        <div class="widget ltn__search-widget">
                            <h4 class="ltn__widget-title ltn__widget-title-border">Tìm Kiếm</h4>
                            <form action="#">
                                <input type="text" name="search" placeholder="Tìm kiếm từ khóa của bạn...">
                                <button type="submit"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                        <!-- Popular Post Widget -->
                        <div class="widget ltn__popular-post-widget">
                            <h4 class="ltn__widget-title ltn__widget-title-border">Blog</h4>
                            <ul v-for="item in blog" :key="item">
                                <li>
                                    <div class="popular-post-widget-item clearfix">
                                        <div class="popular-post-widget-img">
                                            <a href="#"><img :src="'http://localhost:8080/uploads/' + item.images"
                                                    alt="#"></a>
                                        </div>
                                        <div class="popular-post-widget-brief">
                                            <h6><a href="#">{{ item.name }}</a></h6>
                                            <div class="ltn__blog-meta">
                                                <ul>
                                                    <li class="ltn__blog-date">
                                                        <a href="#"><i class="far fa-calendar-alt"></i>
                                                            Ngày 22 tháng 6 năm 2020</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <!-- Social Media Widget -->
                        <div class="widget ltn__social-media-widget">
                            <h4 class="ltn__widget-title ltn__widget-title-border">Không bao giờ bỏ lỡ tin tức</h4>
                            <div class="ltn__social-media-2">
                                <ul>
                                    <li><a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#" title="Twitter"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#" title="Linkedin"><i class="fab fa-linkedin"></i></a></li>
                                    <li><a href="#" title="Instagram"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="#" title="Behance"><i class="fab fa-behance"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Instagram Widget -->
                        <div class="widget ltn__instagram-widget">
                            <h4 class="ltn__widget-title ltn__widget-title-border">Instagram Feeds</h4>
                            <div class="ltn__instafeed ltn__instafeed-grid insta-grid-gutter"></div>
                        </div>
                        <!-- Tagcloud Widget -->
                        <div class="widget ltn__tagcloud-widget">
                            <h4 class="ltn__widget-title ltn__widget-title-border">Tags phổ biến</h4>
                            <ul>
                                <li><a href="#">Popular</a></li>
                                <li><a href="#">desgin</a></li>
                                <li><a href="#">ux</a></li>
                                <li><a href="#">usability</a></li>
                                <li><a href="#">develop</a></li>
                                <li><a href="#">icon</a></li>
                                <li><a href="#">Car</a></li>
                                <li><a href="#">Service</a></li>
                                <li><a href="#">Repairs</a></li>
                                <li><a href="#">Auto Parts</a></li>
                                <li><a href="#">Oil</a></li>
                                <li><a href="#">Dealer</a></li>
                                <li><a href="#">Oil Change</a></li>
                                <li><a href="#">Body Color</a></li>
                            </ul>
                        </div>
                        <!-- Banner Widget -->
                        <div class="widget ltn__banner-widget">
                            <a href="shop.html"><img src="../../public/img/banner/banner-4.jpg" alt="Banner Image"></a>
                        </div>

                    </aside>
                </div>
            </div>
        </div>
    </div>
    <!-- PAGE DETAILS AREA END -->

</template>
<script>
import BlogService from '@/services/BlogService';
export default {
    data() {
        return {
            blogDetail: null,
            blog: null,
        }
    },
    created() {
        BlogService.get(this.$route.params.id)
            .then((response) => {
                this.blogDetail = response.data;
                console.log(this.blogDetail);
            })
            .catch((errors) => {
                console.log(errors);
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
    }
}
</script>