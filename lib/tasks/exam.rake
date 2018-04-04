namespace :exam do

  desc "Populate DB with fake data"
  task seed: :environment do
    create_deputy
    create_challenge
    create_competitors
    create_exams_and_questions
  end

  desc "Create deputy mock"
  task create_deputy: :environment do
    create_deputy
  end

  desc "Create challenge mock"
  task create_challenge: :environment do
    create_challenge
  end

  desc "Create competitors mock"
  task create_competitors: :environment do
    create_competitors
  end

  desc "Create exams and questions mock"
  task create_exams_and_questions: :environment do
    create_exams_and_questions
  end

  private

    def create_deputy
      @deputy = Deputy.create name: "Renan", email: "renanbenattidias@gmail.com", phone: "067981120075", password: "secret123"
      puts "---> Created deputy"
    end

    def create_challenge
      @challenge = @deputy.challenges.create challenge_date: DateTime.now
      puts "---> Created challenge"
    end

    def create_competitors
      @competitors = []
      @competitors.append(@challenge.competitors.create name: "Jonathan", email: "jonathan@gmail.com", password: "secret123")
      @competitors.append(@challenge.competitors.create name: "Bruno", email: "bruno@gmail.com", password: "secret123")
      @competitors.append(@challenge.competitors.create name: "Victor", email: "victor@gmail.com", password: "secret123")
      @competitors.append(@challenge.competitors.create name: "Kramer", email: "kramer@gmail.com", password: "secret123")
      puts "---> Created competitor"
    end

    def create_exams_and_questions
      @competitors.each do |competitor|
        exam = competitor.build_exam
        15.times.with_index do |index|
          question = exam.questions.new name: "Questão #{index+1}", difficulty: rand(1..3), age_group: rand(1..3), explanation: "This is the explanation of the question number #{index+1}", title: "This is the title of the question"
          if question.valid?
            question.save
          else
            raise "Question index+1: #{index+1} is invalid"
          end
        end

        exam.save
      end
      puts "---> Created exams and questions"
    end
end
