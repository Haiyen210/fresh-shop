import { createStore } from 'vuex';
import { createToast } from 'mosha-vue-toastify';
import ProductService from './services/ProductService';
import 'mosha-vue-toastify/dist/style.css'
import router from './router';
export const store = createStore({
    state: {
        cart: JSON.parse(localStorage.getItem("carts")),
        product: [],
        productSale: [],

    },

    getters: {

        total: state => {
            if (state.cart) {
                return state.cart.reduce((acc, val) => {
                    if (val.salePrice == 0) {
                        return acc + val.quantity * val.price
                    } else {
                        return acc + val.quantity * val.salePrice
                    }
                }, 0)
            }
        },
        getProduct: (state) => state.product,
    },
    actions: {
        async fetchProduct({ commit }) {
            try {
                const data = await ProductService.getAll()
                commit('Set_Product', data.data)
            } catch (error) {
                console.log(error)
            }
        },
        async fetchProductSale({ commit }) {
            try {
                const data = await ProductService.getProSale()
                commit('Set_Product_Sale', data.data)
            } catch (error) {
                console.log(error)
            }
        },
        onCart({ commit }, itemId) {
            commit('onCart', itemId)
        },
        onCount({ commit }, proId) {
            commit('onCount', proId);
        },
        onCountMinus({ commit }, proId) {
            commit('onCountMinus', proId);
        },
    },
    mutations: {
        Set_Product(state, product) {
            state.product = product
        },
        Set_Product_Sale(state, productSale) {
            state.productSale = productSale
        },

        onCart(state, itemId) {
            const acc = JSON.parse(localStorage.getItem("login"));
            if (acc) {
                let user = JSON.parse(localStorage.getItem("login"));
                let item = state.product.find(({ id }) => id === itemId);
                let itemIS;
                if (state.cart) {
                    itemIS = state.cart.find(({ id }) => id === itemId);
                }
                console.log(itemIS);
                if (state.cart == null) {
                    state.cart = [];
                }
                if (item && !itemIS) {
                    if (item['quantity'] == null) {
                        item['quantity'] = 1;
                        item['name_user'] = user['name'];
                        state.cart.push(item);
                    }
                }
                if (itemIS) {
                    if (itemIS['quantity']) {
                        itemIS['quantity'] += 1;
                        localStorage.setItem("carts", JSON.stringify(itemIS));
                    }
                }

                if (state.cart != null) {

                    localStorage.setItem("carts", JSON.stringify(state.cart));
                    createToast({
                        title: 'Thành công',
                        description: 'Thêm sản phẩm vào giỏ hàng thành công',
                        type: 'success',
                        timeout: 5000,

                    })
                }
            } else {
                if (confirm("Hãy đăng nhập để thêm sản phẩm vào giỏ hàng!!!!")) {
                    router.push('login');
                }
            }

        },
        onCount(state, ProId) {
            let indexs = state.cart.find(i => i.id === ProId);
            if (indexs) {
                if (indexs.quantity >= 1) {
                    indexs.quantity += 1;
                } else {
                    indexs.quantity = 1;
                }
            }

            localStorage.setItem("carts", JSON.stringify(state.cart));
        },
        onCountMinus(state, proId) {
            let indexs = state.cart.find(({ id }) => id === proId);
            if (indexs) {
                if (indexs.quantity > 1) {
                    indexs.quantity -= 1;
                } else {
                    indexs.quantity = 1;
                }

            }


            localStorage.setItem("carts", JSON.stringify(state.cart));
        },
        removeFromCart(state, item) {
            // console.log(item);
            var indexs = state.cart.indexOf(item);
            if (confirm("Bạn có chắc chắn muốn xóa không?")) {
                state.cart.splice(indexs, 1);
                const parsed = JSON.stringify(state.cart);
                localStorage.setItem('carts', parsed);
            }
        },

    }
});
export default store;