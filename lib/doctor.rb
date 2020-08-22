class Doctor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, patient)
        appointment = Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.find_all{ |appointment| appointment.doctor == self}
    end

    def patients
        self.appointments.map{ |appointment| appointment.patient }.uniq
    end
end