import http from "../http-common";
class OrderService {
    getAll() {
        return http.get("/orders");
    }
    get(id) {
        return http.get(`/orders/${id}`);
    }
    create(data) {
        return http.post("/orders", data);
    }
    update(data) {
        return http.put(`/orders/update`, data);
    }
    delete(id) {
            return http.delete(`/orders/${id}`);
        }
        //   deleteAll() {
        //     return http.delete(`/tutorials`);
        //   }
        //   findByTitle(title) {
        //     return http.get(`/tutorials?title=${title}`);
        //   }
}
export default new OrderService();