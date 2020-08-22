class Patient
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        appointment = Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.find_all{ |appointment| appointment.patient == self}
    end

    def doctors
        self.appointments.map{ |appointment| appointment.doctor }.uniq
    end

end