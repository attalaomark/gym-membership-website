// JavaScript for CRUD operations
let members = [
    { id: '001', name: 'Natalie Johnson', email: 'natalie@example.com', membershipType: 'Monthly', joinDate: '2024-01-01' },
    { id: '002', name: 'John Doe', email: 'john@example.com', membershipType: 'Yearly', joinDate: '2023-12-15' },
    { id: '003', name: 'Jane Smith', email: 'jane@example.com', membershipType: 'Pay As You Go', joinDate: '2024-02-05' }
];

const memberTableBody = document.getElementById('memberTableBody');
const memberModal = document.getElementById('memberModal');
const memberForm = document.getElementById('memberForm');
const modalTitle = document.getElementById('modalTitle');
const addMemberBtn = document.getElementById('addMemberBtn');
const closeBtn = document.getElementsByClassName('close')[0];

// Display members
function displayMembers() {
    memberTableBody.innerHTML = '';
    members.forEach(member => {
        const row = `
            <tr>
                <td>${member.id}</td>
                <td>${member.name}</td>
                <td>${member.email}</td>
                <td>${member.membershipType}</td>
                <td>${formatDate(member.joinDate)}</td>
                <td>
                    <button onclick="editMember('${member.id}')" class="action-btn edit-btn">Edit</button>
                    <button onclick="deleteMember('${member.id}')" class="action-btn delete-btn">Hapus</button>
                </td>
            </tr>
        `;
        memberTableBody.innerHTML += row;
    });
}

// Format date
function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('id-ID', { day: '2-digit', month: '2-digit', year: 'numeric' });
}

// Add member
addMemberBtn.onclick = function() {
    modalTitle.textContent = 'Tambah Member Baru';
    memberForm.reset();
    document.getElementById('memberId').value = '';
    memberModal.style.display = 'block';
}

// Edit member
function editMember(id) {
    const member = members.find(m => m.id === id);
    if (member) {
        modalTitle.textContent = 'Edit Member';
        document.getElementById('memberId').value = member.id;
        document.getElementById('memberName').value = member.name;
        document.getElementById('memberEmail').value = member.email;
        document.getElementById('membershipType').value = member.membershipType;
        document.getElementById('joinDate').value = member.joinDate;
        memberModal.style.display = 'block';
    }
}

// Delete member
function deleteMember(id) {
    if (confirm('Apakah Anda yakin ingin menghapus member ini?')) {
        members = members.filter(member => member.id !== id);
        displayMembers();
    }
}

// Close modal
closeBtn.onclick = function() {
    memberModal.style.display = 'none';
}

// Submit form
memberForm.onsubmit = function(e) {
    e.preventDefault();
    const id = document.getElementById('memberId').value;
    const member = {
        id: id || (Math.max(...members.map(m => parseInt(m.id))) + 1).toString().padStart(3, '0'),
        name: document.getElementById('memberName').value,
        email: document.getElementById('memberEmail').value,
        membershipType: document.getElementById('membershipType').value,
        joinDate: document.getElementById('joinDate').value
    };

    if (id) {
        // Update existing member
        const index = members.findIndex(m => m.id === id);
        members[index] = member;
    } else {
        // Add new member
        members.push(member);
    }

    displayMembers();
    memberModal.style.display = 'none';
}

// Initial display
displayMembers();