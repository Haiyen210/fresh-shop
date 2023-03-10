import http from "../http-common";
class FavoriteService {
    getAll() {
        return http.get("/favorites");
    }
    get(id) {
        return http.get(`/favorites/${id}`);
    }
    create(data) {
        return http.post("/favorites", data);
    }
    update(data) {
        return http.put(`/favorites/update`, data);
    }
    delete(id) {
            return http.delete(`/favorites/${id}`);
        }
        //   deleteAll() {
        //     return http.delete(`/tutorials`);
        //   }
        //   findByTitle(title) {
        //     return http.get(`/tutorials?title=${title}`);
        //   }
}
export default new FavoriteService();