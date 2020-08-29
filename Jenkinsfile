node {
    def cart

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        git 'https://github.com/rafraf1987/cart'
    }

    stage('Build image') {
        /* This builds the actual image */

        cart = docker.build("rafraf1111/cart")
    }

    stage('Test image') {
        
        cart.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
            You would need to first register with DockerHub before you can push images to your account
        */
        docker.withRegistry('https://registry.hub.docker.com', 'docker_hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    stage('remove image') {
        
        docker.rmi("rafraf1111/cart")
    }
}