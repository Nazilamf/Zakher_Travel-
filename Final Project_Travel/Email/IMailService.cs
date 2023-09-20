namespace Final_Project_Travel.Email
{
    public interface IMailService
    {
        Task SendEmailAsync(MailRequest mailRequest);
    }
}
