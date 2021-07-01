using Microsoft.AspNet.SignalR;
using RealEstateNet.Controllers;
using RealEstateNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
namespace RealEstateNet.signalr.hubs
{
    public class ChatHub : Hub
    {
        public void Join(string chatId)
        {
            Groups.Add(Context.ConnectionId, "chat"+chatId);
        }
        public void Send(string message, string chatId, string from)
        {
            DateTime now = DateTime.Now;
            Clients.Group("chat"+chatId).addNewMessageToPage(now.ToString("MM/dd/yyyy HH:mm"), message, from);
            TextMessage text = new TextMessage();
            text.Sender = from;
            text.SendingDate = now.ToString();
            text.Text = message;
            ControllerCall(Convert.ToInt32(chatId), text);
        }

        private void ControllerCall(int chatId, TextMessage message)
        {
            DashboardController controller = new DashboardController();
            controller.SendMessage(chatId, message);
        }
    }
}