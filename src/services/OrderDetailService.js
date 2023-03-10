import http from "../http-common";
class OrderDetailService {
    getAll() {
        return http.get("/orderDetails");
    }
    get(id) {
        return http.get(`/orderDetails/${id}`);
    }
    create(data) {
        return http.post("/orderDetails", data);
    }
    update(data) {
        return http.put(`/orderDetails/update`, data);
    }
    delete(id) {
            return http.delete(`/orderDetails/${id}`);
        }
        //   deleteAll() {
        //     return http.delete(`/tutorials`);
        //   }
        //   findByTitle(title) {
        //     return http.get(`/tutorials?title=${title}`);
        //   }
}
export default new OrderDetailService();