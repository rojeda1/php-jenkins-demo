pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build + Up') {
      steps {
        sh 'docker compose up -d --build'
      }
    }

    stage('Composer install') {
      steps {
        sh '''
          docker compose exec -T app composer install \
            --no-interaction --no-progress --prefer-dist
        '''
      }
    }

    stage('Lint') {
      steps {
        sh '''
          docker compose exec -T app sh -lc \
          'find . -type f -name "*.php" -print0 | xargs -0 -n1 php -l'
        '''
      }
    }

    stage('Tests') {
      steps {
        sh '''
          docker compose exec -T app sh -lc 'vendor/bin/phpunit'
        '''
      }
    }
  }

  post {
    always {
      sh 'docker compose down -v || true'
    }
  }
}
