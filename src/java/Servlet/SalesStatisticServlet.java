package Servlet;

import model.SalesStatistic;
import dao.OrderDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@WebServlet("/SaleStatistic")
public class SalesStatisticServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String period = request.getParameter("period");
        if (period == null) {
            period = "week"; // Default period is week
        }

        SalesStatistic stats = OrderDB.getTodayStatistics();
        request.setAttribute("stats", stats);

        List<Map<String, Object>> chartData = OrderDB.getChartData(period);
        request.setAttribute("chartData", chartData);

        List<Map<String, Object>> topProducts = OrderDB.getTopProducts();
        request.setAttribute("topProducts", topProducts);

        request.getRequestDispatcher("/admin/SaleStatistic.jsp").forward(request, response);
    }
}