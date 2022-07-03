class ParticipantMailer < ApplicationMailer
  def new_task_email
    @user = params[:user]
    @task = params[:task]

    mail to: "prueba@prueba.com", subject: 'Tarea asignada'
  end
end
