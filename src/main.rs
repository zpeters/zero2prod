use actix_web::{web, App, HttpServer, Responder, HttpResponse};

async fn health_check() -> impl Responder {
    println!("/health_request ping");
    HttpResponse::Ok()
}

#[tokio::main]
async fn main() -> std::io::Result<()> {
    println!("Listening on port 8000");
    HttpServer::new(|| {
        App::new()
            .route("/health_check", web::get().to(health_check))
    })
    .bind("127.0.0.1:8000")?
    .run()
    .await
}
