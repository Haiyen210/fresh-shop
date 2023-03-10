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
                            <h1 class="section-title white-color">Đặt Hàng Thành Công</h1>
                        </div>
                        <div class="ltn__breadcrumb-list">
                            <ul>
                                <li><a href="#">Trang Chủ</a></li>
                                <li>Đặt Hàng Thành Công</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB AREA END -->

    <!-- SHOPING CART AREA START -->
    <div class="liton__shoping-cart-area mb-120">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="text-center order_complete">
                        <i class="fas fa-check-circle" style="font-size: 44px;color: green;"></i>
                        <div class="heading_s1">
                            <h3>Đặt Hàng Thành Công!</h3>
                        </div>
                        <p>Cảm ơn bạn đã đặt hàng của bạn! Đơn đặt hàng của bạn đang được xử lý và sẽ được hoàn thành
                            trong vòng 3-6 giờ. Bạn sẽ nhận được một email xác nhận khi đơn đặt hàng của bạn được hoàn
                            thành.</p>
                        <router-link :to="{ name: 'Product' }" class="btn theme-btn-1 btn-effect-1 text-uppercase">Tiếp Tục Mua Hàng</router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- SHOPING CART AREA END -->
</template>
