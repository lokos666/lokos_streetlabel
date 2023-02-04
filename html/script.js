window.addEventListener("DOMContentLoaded", () => {
    window.addEventListener("message", async (e) => {
        if (e.data.action == "show") {
            $(".container").removeClass("hidden");

            let street = e.data.street;

            $(".ulica").text(street);
        } else if (e.data.action == "hide") {
            $(".container").addClass("hidden");
        }
    });
});