import http from "../http-common";
class BlogService {
    getAll() {
        return http.get("/blogs");
    }
    get(id) {
        return http.get(`/blogs/${id}`);
    }
    create(data) {
        return http.post("/blogs", data);
    }
    update(data) {
        return http.put(`/blogs/update`, data);
    }
    delete(id) {
            return http.delete(`/blogs/${id}`);
        }
        //   deleteAll() {
        //     return http.delete(`/tutorials`);
        //   }
        //   findByTitle(title) {
        //     return http.get(`/tutorials?title=${title}`);
        //   }
}
export default new BlogService();