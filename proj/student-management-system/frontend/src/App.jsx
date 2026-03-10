import React, { useState, useEffect } from "react";
import axios from "axios";

// const backendUrl = import.meta.env.VITE_BACKEND_URL || "/api";
const backendUrl = import.meta.env.VITE_BACKEND_URL || "/api";

function App() {
  const [students, setStudents] = useState([]);
  const [name, setName] = useState("");
  const [studentId, setStudentId] = useState("");
  const [subjects, setSubjects] = useState([]);

  const fetchStudents = async () => {
    const res = await axios.get(`${backendUrl}/students`);
    setStudents(res.data);
  };

  useEffect(() => {
    fetchStudents();
  }, []);

  const addSubject = () => {
    setSubjects([...subjects, { subject: "", marks: "" }]);
  };

  const handleSubjectChange = (index, field, value) => {
    const newSubjects = [...subjects];
    newSubjects[index][field] = value;
    setSubjects(newSubjects);
  };

  const handleSubmit = async () => {
    await axios.post(`${backendUrl}/students`, {
      student_id: studentId,
      name: name,
      subjects: subjects.map(s => ({
        subject: s.subject,
        marks: Number(s.marks)
      }))
    });

    fetchStudents();
  };

  return (
    <div style={{ padding: "20px" }}>
      <h2>Add Student</h2>
      <input placeholder="Student ID" onChange={e => setStudentId(e.target.value)} />
      <input placeholder="Name" onChange={e => setName(e.target.value)} />

      <button onClick={addSubject}>Add Subject</button>

      {subjects.map((sub, index) => (
        <div key={index}>
          <input
            placeholder="Subject"
            onChange={e => handleSubjectChange(index, "subject", e.target.value)}
          />
          <input
            placeholder="Marks"
            type="number"
            onChange={e => handleSubjectChange(index, "marks", e.target.value)}
          />
        </div>
      ))}

      <button onClick={handleSubmit}>Submit</button>

      <h2>Students</h2>
      {students.map((stu, index) => (
        <div key={index}>
          <p>{stu.name} - Avg: {stu.average_marks}</p>
        </div>
      ))}
    </div>
  );
}

export default App;