namespace :exam do

  desc "Populate DB with fake data"
  task seed: :environment do
    create_deputy
    create_challenge
    create_competitors
    create_exams_and_questions
    create_alternatives
    create_durations
  end

  private

    def create_deputy
      @deputy = Deputy.create name: "Renan", email: "renan@gmail.com", phone: "067981120075", password: "secret123"
      @deputy = Deputy.create name: "Victor", email: "victor@gmail.com", phone: "067981120075", password: "secret123"
      @deputy = Deputy.create name: "Kramer", email: "kramer@gmail.com", phone: "067981120075", password: "secret123"
      puts "---> Created deputy"
    end

    def create_challenge
      Deputy.all.each.with_index do |deputy, index|
        3.times.with_index do |inner_index|
          deputy.challenges.create start_date: DateTime.now+index, name: "Bebras 2018 Turma #{index} - #{inner_index}"
        end
      end
      puts "---> Created challenges"
    end

    def create_competitors
      @competitors = []
      Challenge.all.each do |challenge|
        @competitors.append(challenge.competitors.create name: "Jonathan", email: "jonathan@gmail.com", password: "secret123")
        @competitors.append(challenge.competitors.create name: "Bruno", email: "bruno@gmail.com", password: "secret123")
        @competitors.append(challenge.competitors.create name: "Victor", email: "victor@gmail.com", password: "secret123")
        @competitors.append(challenge.competitors.create name: "Kramer", email: "kramer@gmail.com", password: "secret123")
        puts "---> Created competitor"
      end
    end

    def create_exams_and_questions
      @competitors.each do |competitor|
        exam = competitor.build_exam
        15.times.with_index do |index|
          question = exam.questions.new name: "Questão #{index+1}", difficulty: rand(1..3), age_group: rand(1..3), explanation: "This is the explanation of the question number #{index+1}", title: "This is the title of the question", html: "<h1>Question #{index+1}</h1>"
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

    def create_alternatives
      alterntive_symbols = ["A", "B", "C", "D"]
      @competitors.each do |competitor|
        questions = competitor.exam.questions
        questions.each do |question|
          4.times.with_index do |index|
            alternative = question.alternatives.new alternative_symbol: alterntive_symbols[index], description: "test", html_text: "<h1>Há alternativa #{index+1}</h1>"
            if alternative.valid?
              alternative.save
            else
              raise "Alternative failed"
            end
          end
        end
      end
      puts "---> Created alternatives"
    end

    def create_durations
      ExamDuration.create exam_duration_in_minutes: 45
    end
end

