import http from "../http-common";
class AccountService {
    getAll() {
        return http.get("/accounts");
    }
    get(id) {
        return http.get(`/accounts/${id}`);
    }
    getEmail(email) {
        return http.get(`/accounts/email/${email}`);
    }
    create(data) {
        return http.post("/accounts", data);
    }
    update(data) {
        return http.put(`/accounts/update`, data);
    }
    delete(id) {
            return http.delete(`/accounts/${id}`);
        }
        //   deleteAll() {
        //     return http.delete(`/tutorials`);
        //   }
        //   findByTitle(title) {
        //     return http.get(`/tutorials?title=${title}`);
        //   }
}
export default new AccountService();