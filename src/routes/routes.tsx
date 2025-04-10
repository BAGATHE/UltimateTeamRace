import React from "react";
import { Route, Routes } from "react-router-dom";
import LoginPage from "../pages/LoginPage";
import ParentLayout from "../pages/ParentLayout";
import DashboardPage from "../pages/DashboardPage";

const RenderRoutes = () => {
    return (
      <Routes>
        {/* Routes publiques */}
        <Route path="/" element={<LoginPage />} />
        
        {/* Routes protégées avec layout */}
        <Route element={<ParentLayout />}>
          <Route path="/dashboard" element={<DashboardPage />} />
        </Route>
      </Routes>
    );
};
  
export { RenderRoutes }; 