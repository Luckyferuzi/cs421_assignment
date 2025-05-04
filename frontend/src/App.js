import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [students, setStudents] = useState([]);
  const [subjects, setSubjects] = useState([]);
  const [nodeId, setNodeId] = useState('');
  const [error, setError] = useState(null);
  const [loadingStudents, setLoadingStudents] = useState(false);
  const [loadingSubjects, setLoadingSubjects] = useState(false);

  useEffect(() => {
    axios.get('http://16.171.225.235', { withCredentials: true })
      .then(response => {
        const node = response.headers['x-node-id'] || 'Unknown';
        setNodeId(node);
      })
      .catch(err => {
        console.error('Error fetching node ID:', err.message);
        setError('Failed to fetch node ID: ' + (err.message || 'Unknown error'));
      });
  }, []);

  const fetchStudents = () => {
    setLoadingStudents(true);
    setError(null);
    axios.get('/api/students')
      .then(response => {
        const data = Array.isArray(response.data) ? response.data : (response.data.data || []);
        if (data.length > 0 && !data[0].id) {
          console.warn('Invalid student data structure:', data);
        }
        setStudents(data);
        setSubjects([]);
      })
      .catch(err => {
        console.error('Error fetching students:', {
          message: err.message,
          status: err.response?.status,
          data: err.response?.data
        });
        const errorMsg = err.response?.data?.error || err.message || 'Server error';
        setError('Failed to fetch students: ' + errorMsg);
      })
      .finally(() => setLoadingStudents(false));
  };

  const fetchSubjects = () => {
    setLoadingSubjects(true);
    setError(null);
    axios.get('/api/subjects')
      .then(response => {
        const data = Array.isArray(response.data) ? response.data : (response.data.data || []);
        console.log('Subjects data received:', data); // Debug log
        if (data.length > 0 && (!data[0].id || !data[0].name || !data[0].year)) {
          console.warn('Invalid subject data structure:', data);
        }
        setSubjects(data);
        setStudents([]);
      })
      .catch(err => {
        console.error('Error fetching subjects:', {
          message: err.message,
          status: err.response?.status,
          data: err.response?.data
        });
        const errorMsg = err.response?.data?.error || err.message || 'Server error';
        setError('Failed to fetch subjects: ' + errorMsg);
      })
      .finally(() => setLoadingSubjects(false));
  };

  return (
    <div className="App">
      <h1>CS 421 Front-End</h1>
      <p>Responding Node: {nodeId}</p>
      {error && <p style={{ color: 'red' }}>Error: {error}</p>}
      <div>
        <button id="btn-students" onClick={fetchStudents} disabled={loadingStudents}>
          {loadingStudents ? 'Loading...' : 'Students'}
        </button>
        <button id="btn-courses" onClick={fetchSubjects} disabled={loadingSubjects}>
          {loadingSubjects ? 'Loading...' : 'Courses'}
        </button>
      </div>
      {students.length > 0 && (
        <div>
          <h2>Students</h2>
          <ul>
            {students.map(student => (
              <li key={student.id}>{student.name} - {student.program}</li>
            ))}
          </ul>
        </div>
      )}
      {subjects.length > 0 && (
        <div>
          <h2>Courses</h2>
          <ul>
            {subjects.map(subject => (
              <li key={subject.id}>{subject.name} (Year {subject.year})</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}

export default App;
