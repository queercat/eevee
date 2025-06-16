#include <GLFW/glfw3.h>
#include <spdlog/spdlog.h>

void error_callback(int error, const char* description) {
    spdlog::error("An error has occurred, \n\tcode: {},\n\t description: {}\n", error, description);
}

int main() {
    if (!glfwInit()) {
        spdlog::error("Unable to initialize GLFW!");
        exit(EXIT_FAILURE);
    }

    spdlog::info("Initialized GLFW.");

    glfwSetErrorCallback(error_callback);

    GLFWwindow* window = glfwCreateWindow(640, 480, "Eevee", nullptr, nullptr);

    if (!window) {
        spdlog::error("Unable to create window!");
        exit(EXIT_FAILURE);
    }

    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);
    glfwSwapBuffers(window);

    while (!glfwWindowShouldClose(window)) {
        int width, height;
        glfwGetFramebufferSize(window, &width, &height);
        glViewport(0, 0, width, height);
        glClear(GL_COLOR_BUFFER_BIT);

        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    spdlog::info("Destroying window...");
    glfwDestroyWindow(window);
    glfwTerminate();

    exit(EXIT_SUCCESS);
}