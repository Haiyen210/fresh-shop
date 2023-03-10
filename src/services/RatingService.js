import http from "../http-common";
class RatingService {
    getAll() {
        return http.get("/ratings");
    }
    get(id) {
        return http.get(`/ratings/${id}`);
    }
    getStar(id) {
        return http.get(`/ratings/star/${id}`);
    }

    create(data) {
        return http.post("/ratings", data);
    }
    update(data) {
        return http.put(`/ratings/update`, data);
    }
    delete(id) {
            return http.delete(`/ratings/${id}`);
        }
        //   deleteAll() {
        //     return http.delete(`/tutorials`);
        //   }
        //   findByTitle(title) {
        //     return http.get(`/tutorials?title=${title}`);
        //   }
}
export default new RatingService();