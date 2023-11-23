package booking.servlet;

import java.io.IOException;

import booking.model.Passenger;
import booking.service.PassengerService;
import booking.service.PassengerServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPassengerServlet")
public class AddPassengerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddPassengerServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        // Use a PassengerFactory to create Passenger objects
        PassengerFactory passengerFactory = new PassengerFactory();
        Passenger passenger = passengerFactory.createPassenger(request);

        PassengerService passengerService = new PassengerServiceImp();
        passengerService.addPassenger(passenger);

        request.setAttribute("passenger", passenger);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/allPassengers.jsp");
        dispatcher.forward(request, response);
    }
}

//Class for the creation of passenger objects - Applying factory design pattern
class PassengerFactory {
    public Passenger createPassenger(HttpServletRequest request) {
        Passenger passenger = new Passenger();
        passenger.setName(request.getParameter("Name"));
        passenger.setAddress(request.getParameter("Address"));
        passenger.setEmail(request.getParameter("Email"));
        passenger.setConNum(request.getParameter("Contact"));
        passenger.setNIC(request.getParameter("NIC"));
        return passenger;
    }
}
