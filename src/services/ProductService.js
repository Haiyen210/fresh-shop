import http from "../http-common";
class ProductService {
    getAll() {
        return http.get("/products");
    }
    getProSale() {
        return http.get("/products/sale");
    }
    get(id) {
        return http.get(`/products/${id}`);
    }
    getCat(id) {
        return http.get(`/products/related/${id}`);
    }
    create(data) {
        return http.post("/products", data);
    }
    update(data) {
        return http.put(`/products/update`, data);
    }
    delete(id) {
            return http.delete(`/products/${id}`);
        }
        //   deleteAll() {
        //     return http.delete(`/tutorials`);
        //   }
        //   findByTitle(title) {
        //     return http.get(`/tutorials?title=${title}`);
        //   }
}
export default new ProductService();