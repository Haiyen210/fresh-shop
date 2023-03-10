import http from "../http-common";
class EmailService {
    sendEmail(data) {
        return http.post("/send-mail", data);
    }
    sendMailOrder(data) {
        return http.post("/order-success", data);
    }
}
export default new EmailService()