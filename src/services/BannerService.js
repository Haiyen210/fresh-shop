import http from "../http-common";
class BannerService {
  getAll() {
    return http.get("/banners");
  }
  get(id) {
    return http.get(`/banners/${id}`);
  }
  create(data) {
    return http.post("/banners", data);
  }
  update(data) {
    return http.put(`/banners/update`, data);
  }
  delete(id) {
    return http.delete(`/banners/${id}`);
  }
  //   deleteAll() {
  //     return http.delete(`/tutorials`);
  //   }
  //   findByTitle(title) {
  //     return http.get(`/tutorials?title=${title}`);
  //   }
}
export default new BannerService();
