import http from "../http-common";
class CategoryService {
  getAll() {
    return http.get("/categorys");
  }
  get(id) {
    return http.get(`/categorys/${id}`);
  }
  create(data) {
    return http.post("/categorys", data);
  }
  update(data) {
    return http.put(`/categorys/update`, data);
  }
  delete(id) {
    return http.delete(`/categorys/${id}`);
  }
  //   deleteAll() {
  //     return http.delete(`/tutorials`);
  //   }
  //   findByTitle(title) {
  //     return http.get(`/tutorials?title=${title}`);
  //   }
}
export default new CategoryService();
