class ResponseApi {
    late String message;
    late String error;
    late bool succes;
    dynamic data;

    ResponseApi({
        required this.message,
        required this.error,
        required this.succes,
    });

    ResponseApi.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        error = json["error"];
        succes = json["succes"];

        try {
            data = json["data"];
        } catch (e) {
            print('Exception data: $e');
        }
    }

    Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "succes": succes,
    };
}
