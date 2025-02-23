import { CartesianGrid, Legend, Line, LineChart, Tooltip, XAxis, YAxis } from "recharts"
import "./App.css"

const data = [
  { time: "00:00", capacity: 10 },
  { time: "01:00", capacity: 15 },
  { time: "02:00", capacity: 20 },
  { time: "03:00", capacity: 2 },
]

function App() {
  return (
    <LineChart width={730} height={250} data={data} margin={{ top: 5, right: 30, left: 20, bottom: 5 }}>
      <CartesianGrid strokeDasharray="3 3" />
      <XAxis dataKey="time" />
      <YAxis />
      <Tooltip />
      <Legend />
      <Line type="monotone" dataKey="capacity" />
    </LineChart>
  )
}

export default App
