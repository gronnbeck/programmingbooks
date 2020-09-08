(ns ring-app.core
  (:require [reitit.ring :as reitit]
            [ring.adapter.jetty :as jetty]
            [muuntaja.middleware :as muuntaja]
            [ring.util.http-response :as response]
            [ring.middleware.reload :refer [wrap-reload]]))

(defn http-handler [request-map]
  (response/ok
   (str "<html><body>Hello, your IP is: "
              (:remote-addr request-map)
              "</body></html>")))

(defn json-handler [request]
  (response/ok
   {:result (get-in request [:body-params :id])}))

(defn wrap-nocache [handler]
  (fn [request]
    (-> request
        handler
        (assoc-in [:headers "Pragma"] "no-cache"))))

(defn wrap-formats [handler]
  (-> handler
      (muuntaja/wrap-format)))

(def routes
  [["/" {:get http-handler
         :post http-handler}]
   ["/echo/:id"
    (fn [{{:keys [id]} :path-params}]
      (response/ok (str "<p>the value is: " id "</p>")))]
   ["/api"
    {:middleware [wrap-formats]}
     ["/multiply"
      {:post
       (fn [{{:keys [a b]} :body-params}]
         (response/ok {:result (* a b)}))}]]])

(def handler
  (reitit/routes
   (reitit/ring-handler
    (reitit/router routes))
   (reitit/create-resource-handler
    {:path "/"})
   (reitit/create-default-handler
    {:not-found
     (constantly (response/not-found "404 - Page not found"))
     :method-not-allowed
     (constantly (response/method-not-allowed "405 - Not allowed"))
     :not-accetable
     (constantly (response/not-acceptable "406 - Not acceptable"))})))

(defn -main []
  (jetty/run-jetty
   (-> #'handler
       wrap-nocache
       wrap-reload)
   {:port 3000
    :join? false}))
