class ResponseApi {
  late String message;
  late String? error;
  late bool success; // Asegúrate de inicializar con un valor por defecto
  dynamic data;

  ResponseApi({
    required this.message,
    required this.error,
    required this.success,
    required this.data,
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    message = json["message"] ?? "Sin mensaje"; // Valor predeterminado
    error = json["error"];
    success = json["success"] ?? true; // Valor predeterminado si falta o es null
    try {
      data = json["data"] ?? ''; // Reemplaza valores nulos por una cadena vacía
    } catch (e) {
      print('Exception data: $e');
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": data,
      };
}
