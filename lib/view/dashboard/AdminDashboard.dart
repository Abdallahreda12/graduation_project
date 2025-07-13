import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  // Statistics
  int adoptionRequestsCount = 15;
  int helpRequestsCount = 10;
  int usersCount = 10;
  int doctorsCount = 8;

  // Data lists
  List<Map<String, dynamic>> adoptionRequests = [];
  List<Map<String, dynamic>> helpRequests = [];
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> doctors = [];

  // Loading states
  bool isLoading = true;
  bool isDeletingItem = false;

  // Selected tab
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Future.wait([
        loadAdoptionRequests(),
        loadHelpRequests(),
        loadUsers(),
        loadDoctors(),
      ]);

      // Update counts
      adoptionRequestsCount = 10;
      helpRequestsCount = 15;
      usersCount = 10;
      doctorsCount = 8;
    } catch (e) {
      print('Error loading dashboard data: $e');
      _showErrorSnackBar('Failed to load dashboard data');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadAdoptionRequests() async {
    try {
      final response = await http.get(
        Uri.parse('YOUR_API_URL/adoption-requests'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          adoptionRequests =
              List<Map<String, dynamic>>.from(data['data'] ?? []);
        });
      }
    } catch (e) {
      print('Error loading adoption requests: $e');
    }
  }

  Future<void> loadHelpRequests() async {
    try {
      final response = await http.get(
        Uri.parse('YOUR_API_URL/help-requests'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          helpRequests = List<Map<String, dynamic>>.from(data['data'] ?? []);
        });
      }
    } catch (e) {
      print('Error loading help requests: $e');
    }
  }

  Future<void> loadUsers() async {
    try {
      final response = await http.get(
        Uri.parse('YOUR_API_URL/users'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          users = List<Map<String, dynamic>>.from(data['data'] ?? []);
        });
      }
    } catch (e) {
      print('Error loading users: $e');
    }
  }

  Future<void> loadDoctors() async {
    try {
      final response = await http.get(
        Uri.parse('YOUR_API_URL/doctors'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          doctors = List<Map<String, dynamic>>.from(data['data'] ?? []);
        });
      }
    } catch (e) {
      print('Error loading doctors: $e');
    }
  }

  Future<void> deleteItem(String endpoint, String id, String itemType) async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete $itemType'),
        content: Text(
            'Are you sure you want to delete this $itemType? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() {
      isDeletingItem = true;
    });

    try {
      final response = await http.delete(
        Uri.parse('YOUR_API_URL/$endpoint/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        _showSuccessSnackBar('$itemType deleted successfully');
        loadDashboardData();
      } else {
        _showErrorSnackBar('Failed to delete $itemType');
      }
    } catch (e) {
      print('Error deleting $itemType: $e');
      _showErrorSnackBar('Failed to delete $itemType');
    } finally {
      setState(() {
        isDeletingItem = false;
      });
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 600 ? 40 : 20,
                vertical: 16,
              ),
              child: Column(
                children: [
                  // Header section
                  Padding(
                    padding: EdgeInsets.only(
                      top: constraints.maxWidth > 600 ? 20 : 10,
                      bottom: constraints.maxWidth > 600 ? 30 : 20,
                    ),
                    child: TextAndBackArrowHeader(
                      onTap: () {
                        Get.toNamed("/homepage");
                      },
                      texts: ["Admin", " Dashboard"],
                      colorsOfTexts: [ColorsApp.primaryColor, Colors.black],
                    ),
                  ),

                  // Content section
                  Expanded(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _buildResponsiveContent(constraints),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadDashboardData,
        backgroundColor: ColorsApp.primaryColor,
        child: const Icon(Icons.refresh, color: Colors.white),
        tooltip: 'Refresh Data',
      ),
    );
  }

  Widget _buildResponsiveContent(BoxConstraints constraints) {
    final isDesktop = constraints.maxWidth > 1200;
    final isTablet = constraints.maxWidth > 600;
    final isMobile = constraints.maxWidth <= 600;

    if (isDesktop) {
      return _buildDesktopLayout();
    } else if (isTablet) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  // Desktop Layout (> 1200px)
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left sidebar with stats and navigation
        SizedBox(
          width: 320,
          child: Column(
            children: [
              _buildStatisticsGrid(2, 1.4),
              const SizedBox(height: 24),
              _buildVerticalTabNavigation(),
            ],
          ),
        ),
        const SizedBox(width: 24),
        // Main content area
        Expanded(
          child: _buildDataSection(),
        ),
      ],
    );
  }

  // Tablet Layout (600px - 1200px)
  Widget _buildTabletLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildStatisticsGrid(4, 1.2),
          const SizedBox(height: 24),
          _buildHorizontalTabNavigation(),
          const SizedBox(height: 20),
          _buildDataSection(),
        ],
      ),
    );
  }

  // Mobile Layout (< 600px)
  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildStatisticsGrid(2, 1.3),
          const SizedBox(height: 20),
          _buildScrollableTabNavigation(),
          const SizedBox(height: 16),
          _buildMobileDataSection(),
        ],
      ),
    );
  }

  // Responsive Statistics Grid
  Widget _buildStatisticsGrid(int crossAxisCount, double childAspectRatio) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: childAspectRatio,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildStatCard(
          'Adoption\nRequests',
          adoptionRequestsCount,
          Icons.pets,
          Colors.orange,
        ),
        _buildStatCard(
          'Help\nRequests',
          helpRequestsCount,
          Icons.help,
          Colors.blue,
        ),
        _buildStatCard(
          'Users',
          usersCount,
          Icons.people,
          Colors.green,
        ),
        _buildStatCard(
          'Doctors',
          doctorsCount,
          Icons.local_hospital,
          Colors.red,
        ),
      ],
    );
  }

  // Enhanced Stat Card
  Widget _buildStatCard(String title, int count, IconData icon, Color color) {
    return Card(
      elevation: 6,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.15), color.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32,
                color: color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Vertical Tab Navigation for Desktop
  Widget _buildVerticalTabNavigation() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildVerticalTabButton('Adoption Requests', 0, Icons.pets),
            _buildVerticalTabButton('Help Requests', 1, Icons.help),
            _buildVerticalTabButton('Users', 2, Icons.people),
            _buildVerticalTabButton('Doctors', 3, Icons.local_hospital),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalTabButton(String title, int index, IconData icon) {
    final isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? ColorsApp.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? ColorsApp.primaryColor : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey.shade600,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Horizontal Tab Navigation for Tablet
  Widget _buildHorizontalTabNavigation() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: _buildHorizontalTabButton('Adoption', 0)),
          Expanded(child: _buildHorizontalTabButton('Help', 1)),
          Expanded(child: _buildHorizontalTabButton('Users', 2)),
          Expanded(child: _buildHorizontalTabButton('Doctors', 3)),
        ],
      ),
    );
  }

  Widget _buildHorizontalTabButton(String title, int index) {
    final isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? ColorsApp.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Scrollable Tab Navigation for Mobile
  Widget _buildScrollableTabNavigation() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildScrollableTabButton('Adoption Requests', 0),
          _buildScrollableTabButton('Help Requests', 1),
          _buildScrollableTabButton('Users', 2),
          _buildScrollableTabButton('Doctors', 3),
        ],
      ),
    );
  }

  Widget _buildScrollableTabButton(String title, int index) {
    final isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? ColorsApp.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? ColorsApp.primaryColor : Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: ColorsApp.primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // Data Section for Desktop/Tablet
  Widget _buildDataSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getSelectedTabTitle(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: loadDashboardData,
                  icon: const Icon(Icons.refresh),
                  color: ColorsApp.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _buildDataTable(),
            ),
          ],
        ),
      ),
    );
  }

  // Mobile Data Section
  Widget _buildMobileDataSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _getSelectedTabTitle(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: loadDashboardData,
                  icon: const Icon(Icons.refresh),
                  color: ColorsApp.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: _buildMobileCardView(),
            ),
          ],
        ),
      ),
    );
  }

  // Data Table for Desktop/Tablet
  Widget _buildDataTable() {
    List<Map<String, dynamic>> currentData = _getCurrentTabData();

    if (currentData.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No ${_getSelectedTabTitle()} found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        headingRowHeight: 60,
        dataRowHeight: 70,
        headingTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        columns: _getColumnsForCurrentTab(),
        rows: currentData.map((item) => _buildDataRow(item)).toList(),
      ),
    );
  }

  // Mobile Card View
  Widget _buildMobileCardView() {
    List<Map<String, dynamic>> currentData = _getCurrentTabData();

    if (currentData.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No ${_getSelectedTabTitle()} found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: currentData.length,
      itemBuilder: (context, index) {
        final item = currentData[index];
        return _buildMobileCard(item);
      },
    );
  }

  Widget _buildMobileCard(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorsApp.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'ID: ${item['id']?.toString() ?? 'N/A'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: isDeletingItem
                        ? null
                        : () {
                            deleteItem(_getEndpointForTab(),
                                item['id'].toString(), _getSelectedTabTitle());
                          },
                    icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                    tooltip: 'Delete',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ..._buildMobileCardContent(item),
          ],
        ),
      ),
    );
  }

  // Helper Methods
  String _getSelectedTabTitle() {
    switch (selectedTab) {
      case 0:
        return 'Adoption Requests';
      case 1:
        return 'Help Requests';
      case 2:
        return 'Users';
      case 3:
        return 'Doctors';
      default:
        return 'Dashboard';
    }
  }

  List<Map<String, dynamic>> _getCurrentTabData() {
    switch (selectedTab) {
      case 0:
        return adoptionRequests;
      case 1:
        return helpRequests;
      case 2:
        return users;
      case 3:
        return doctors;
      default:
        return [];
    }
  }

  List<DataColumn> _getColumnsForCurrentTab() {
    switch (selectedTab) {
      case 0:
        return const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('User Name')),
          DataColumn(label: Text('Animal Name')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Actions')),
        ];
      case 1:
        return const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('User Name')),
          DataColumn(label: Text('Subject')),
          DataColumn(label: Text('Priority')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Actions')),
        ];
      case 2:
        return const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Phone')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Actions')),
        ];
      case 3:
        return const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Specialization')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Phone')),
          DataColumn(label: Text('Actions')),
        ];
      default:
        return [];
    }
  }

  DataRow _buildDataRow(Map<String, dynamic> item) {
    return DataRow(
      cells: _getCellsForCurrentTab(item),
    );
  }

  List<DataCell> _getCellsForCurrentTab(Map<String, dynamic> item) {
    switch (selectedTab) {
      case 0:
        return [
          DataCell(Text(item['id']?.toString() ?? '')),
          DataCell(Text(item['user_name']?.toString() ?? '')),
          DataCell(Text(item['animal_name']?.toString() ?? '')),
          DataCell(Text(item['status']?.toString() ?? '')),
          DataCell(Text(item['created_at']?.toString() ?? '')),
          DataCell(_buildActionButtons(item)),
        ];
      case 1:
        return [
          DataCell(Text(item['id']?.toString() ?? '')),
          DataCell(Text(item['user_name']?.toString() ?? '')),
          DataCell(Text(item['subject']?.toString() ?? '')),
          DataCell(Text(item['priority']?.toString() ?? '')),
          DataCell(Text(item['created_at']?.toString() ?? '')),
          DataCell(_buildActionButtons(item)),
        ];
      case 2:
        return [
          DataCell(Text(item['id']?.toString() ?? '')),
          DataCell(Text(item['name']?.toString() ?? '')),
          DataCell(Text(item['email']?.toString() ?? '')),
          DataCell(Text(item['phone']?.toString() ?? '')),
          DataCell(Text(item['status']?.toString() ?? '')),
          DataCell(_buildActionButtons(item)),
        ];
      case 3:
        return [
          DataCell(Text(item['id']?.toString() ?? '')),
          DataCell(Text(item['name']?.toString() ?? '')),
          DataCell(Text(item['specialization']?.toString() ?? '')),
          DataCell(Text(item['email']?.toString() ?? '')),
          DataCell(Text(item['phone']?.toString() ?? '')),
          DataCell(_buildActionButtons(item)),
        ];
      default:
        return [];
    }
  }

  Widget _buildActionButtons(Map<String, dynamic> item) {
    return IconButton(
      onPressed: isDeletingItem
          ? null
          : () {
              deleteItem(_getEndpointForTab(), item['id'].toString(),
                  _getSelectedTabTitle());
            },
      icon: const Icon(Icons.delete, color: Colors.red),
      tooltip: 'Delete',
    );
  }

  String _getEndpointForTab() {
    switch (selectedTab) {
      case 0:
        return 'adoption-requests';
      case 1:
        return 'help-requests';
      case 2:
        return 'users';
      case 3:
        return 'doctors';
      default:
        return '';
    }
  }

  List<Widget> _buildMobileCardContent(Map<String, dynamic> item) {
    switch (selectedTab) {
      case 0:
        return [
          _buildInfoRow('User Name', item['user_name']?.toString() ?? 'N/A'),
          _buildInfoRow(
              'Animal Name', item['animal_name']?.toString() ?? 'N/A'),
          _buildInfoRow('Status', item['status']?.toString() ?? 'N/A'),
          _buildInfoRow('Date', item['created_at']?.toString() ?? 'N/A'),
        ];
      case 1:
        return [
          _buildInfoRow('User Name', item['user_name']?.toString() ?? 'N/A'),
          _buildInfoRow('Subject', item['subject']?.toString() ?? 'N/A'),
          _buildInfoRow('Priority', item['priority']?.toString() ?? 'N/A'),
          _buildInfoRow('Date', item['created_at']?.toString() ?? 'N/A'),
        ];
      case 2:
        return [
          _buildInfoRow('Name', item['name']?.toString() ?? 'N/A'),
          _buildInfoRow('Email', item['email']?.toString() ?? 'N/A'),
          _buildInfoRow('Phone', item['phone']?.toString() ?? 'N/A'),
          _buildInfoRow('Address', item['address']?.toString() ?? 'N/A'),
        ];
      case 3:
        return [
          _buildInfoRow(
              'Product Name', item['product_name']?.toString() ?? 'N/A'),
          _buildInfoRow('Category', item['category']?.toString() ?? 'N/A'),
          _buildInfoRow('Price', item['price']?.toString() ?? 'N/A'),
          _buildInfoRow('Stock', item['stock']?.toString() ?? 'N/A'),
        ];
      default:
        return [
          _buildInfoRow('ID', item['id']?.toString() ?? 'N/A'),
          _buildInfoRow('Name', item['name']?.toString() ?? 'N/A'),
          _buildInfoRow('Status', item['status']?.toString() ?? 'N/A'),
          _buildInfoRow('Date', item['created_at']?.toString() ?? 'N/A'),
        ];
    }
  }
}

Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}
