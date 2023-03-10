<template>

    <div class="ltn__utilize-overlay"></div>

    <!-- BREADCRUMB AREA START -->
    <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-overlay-theme-black-90 bg-image pt-115 pb-110"
        data-bg="img/bg/9.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                        <div class="section-title-area ltn__section-title-2">  
                            <h1 class="section-title white-color">Lỗi 404</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>404</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- 404 area start -->
    <div class="ltn__404-area ltn__404-area-1 mb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="error-404-inner text-center">
                        <h1 class="error-404-title">404</h1>
                        <h3>U Là Trời! Trang bạn đang tìm kiếm không tồn tại. Nó có thể đã bị di chuyển hoặc bị xóa.</h3>
                        <!-- <h3>Oops! Looks like something going rong</h3> -->
                        <!-- <p></p> -->
                        <div class="btn-wrapper">
                            <router-link :to="{name:'Home'}" class="btn btn-transparent"><i
                                    class="fas fa-long-arrow-alt-left"></i> Trở Về Trang Chủ</router-link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 404 area end -->
</template>