import Home from "./pages/home";
import { BrowserRouter } from "react-router-dom";
import { Route, Routes } from "react-router-dom";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={< Home />} />
      </Routes>
    </BrowserRouter >

  );
}